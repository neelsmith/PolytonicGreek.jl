# Functions for manipulating accents.


"""Implement GreekOrthography's rmaccents function for LiteraryGreekOrthography.

$(SIGNATURES)
"""
function rmaccents(s::AbstractString, ortho::LiteraryGreekOrthography)
    stripped = []
    dict = accentstripdict(ortho)
    for c in nfkc(s)
        if c in keys(dict)
            push!(stripped, dict[c])
        else
            push!(stripped,c)
        end
    end
    join(stripped,"")
end


"""
Add an acute accent to a single vowel or diphthong.

$(SIGNATURES)

# Examples
```julia-repl
julia> PolytonicGreek.addacute("ᾀ")
"ᾄ"
julia> PolytonicGreek.addacute("τα")
┌ Warning: addacute: can't add acute accent to vowel τα
```
"""
function addacute(vowel::AbstractString; ortho::OrthographicSystem=literaryGreek())
    bare = stripquant(vowel)
    dict = acutedict(ortho)
    if bare in keys(dict)
        accented = dict[bare]
        if occursin("_", vowel)
            string(accented,"_")
        else
            accented
        end
    else
        @warn("addacute: can't add acute accent to string $vowel")
        nothing
    end
end


"""
Add a circumflex accent to a single vowel or diphthong

$(SIGNATURES)

# Examples

```julia-repl
julia> PolytonicGreek.addcircumflex("ᾀ")
"ᾆ"
julia> PolytonicGreek.addcircumflex("τα")
┌ Warning: addcircumflex: can't add circumflex accent to vowel τα
```
"""
function addcircumflex(vowel::AbstractString; ortho::OrthographicSystem=literaryGreek())
    bare = stripquant(vowel)
    dict = circumflexdict(ortho) 
    if bare in keys(dict)
        accented = dict[bare]
        if occursin("_", vowel)
            string(accented,"_")
        else
            accented
        end
    else
        @warn("addcircumflex: can't add circumflex accent to string $vowel")
        nothing
    end
end

"""
Add specified accent to a single syllable.  

$(SIGNATURES)

# Parameters

`syll` is a string value for a single syllable.
`accent` is either `:ACUTE` or `:CIRCUMFLEX`.  The
function returns `nothing` for any other symble for accent.

# Examples

```julia-repl
julia> PolytonicGreek.accentsyllable("των", :CIRCUMFLEX)
"τῶν"
julia> PolytonicGreek.accentsyllable("τα", :ACUTE)
"τά"
julia> PolytonicGreek.accentsyllable("ᾀ", :ACUTE)
"ᾄ"
```
"""
function accentsyllable(syll::AbstractString, accent::Symbol)
    # Check that syll is only one syllable
    sylls = syllabify(syll)
    if length(sylls) > 1
        @warn("accentsyllable: string $syll is more than one syllable.")
        nothing
    else
        vowels = vowelsonly(syll)
        barevowels = stripquant(vowels)

        if accent == :ACUTE
            accentedvowel = addacute(barevowels)
            if occursin("_", vowels)
                rplcmnt = string(accentedvowel,"_")
                replace(syll, string(barevowels,"_") => rplcmnt)
            else 
                replace(syll, barevowels => accentedvowel)
            end

        elseif accent == :CIRCUMFLEX
            accentedvowel = addcircumflex(barevowels)
            if occursin("_", vowels)
                rplcmnt = string(accentedvowel,"_")
                replace(syll, string(barevowels,"_") => rplcmnt)
            else 
                replace(syll, barevowels => accentedvowel)
            end

        else
            @warn("accentsyllable: value of accent was neither :ACUTE nor :CIRCUMFLEX.")
        end
    end
end


"""Place accent on ultima.

$(SIGNATURES)
"""
function accentultima(wrd::AbstractString, accent::Symbol)
    sylls = syllabify(wrd)
    sylls[end] = accentsyllable(ultima(wrd), accent)
    join(sylls,"")
end

"""Place accent on penult.

$(SIGNATURES)
"""
function accentpenult(wrd::AbstractString, accent::Symbol)
    sylls = syllabify(wrd)
    if length(sylls) < 2
        @warn("accentpenult: can't accent word with fewer than two syllables $wrd")
        nothing
    else
        sylls[end - 1] = accentsyllable(penult(wrd), accent)
        join(sylls,"")
    end
end

"""Place accent on antepenult.

$(SIGNATURES)
"""
function accentantepenult(wrd::AbstractString)
    sylls = syllabify(wrd)
    if length(sylls) < 3
        @warn("accentantepenult: can't accent word with fewer than three syllables $wrd")
        nothing
    else
        sylls[end - 2] = accentsyllable(antepenult(wrd), :ACUTE)
        join(sylls,"")
    end
end


"""
Accent word according to specified system of accent placement.

$(SIGNATURES)

# Parameters

- `wrd` is a string value representing a single lexical token.
- `placement` is one of `:RECESSIVE` for recessive accent 
or `:PENULT` for persistent accent on the penultimate syllable.

Note that it is not possible to accent the ultima correctly without
additional morphological information beyond the string value of the token.
"""
function  accentword(wrd::AbstractString, placement::Symbol)
    sylls = syllabify(wrd)
    ult = ultima(wrd)
    if placement == :PENULT    
        if length(sylls) < 2
            @warn("accentword: cannot accent $wrd on penult since it does not have two syllables.")
            nothing
        else
            pnlt = penult(wrd)
            if longsyllable(pnlt) && finalshort(ult)
                accentpenult(wrd, :CIRCUMFLEX)
            else
                accentpenult(wrd, :ACUTE)
            end
        end
         
    elseif placement == :RECESSIVE
        if length(sylls) < 2
            @warn("accentword: string $wrd has fewer than 2 syllables.")
            nothing
        else
            if length(sylls) == 2
                accentword(wrd, :PENULT)

            elseif finallong(ult)
                accentpenult(wrd, :ACUTE)

            else
                accentantepenult(wrd)
            end
        end
     
    else
        @warn("accentword: value of placement was neither :PENULT nor :RECESSIVE.")
    end
end



"""Return ultima.

$(SIGNATURES)
"""
function ultima(s)
    sylls = syllabify(s)
    if isempty(sylls)
        @warn("ultima: no syllables in string $s")
        nothing
    else
        sylls[end]
    end
end


"""Return penult.

$(SIGNATURES)
"""
function penult(s)
    sylls = syllabify(s)
    if length(sylls) < 2
        @warn("penult: cannot extract penult from word with < 2 syllables: $s")
        nothing
    else
        sylls[end - 1]
    end
end

"""Return antepenult.

$(SIGNATURES)

NB: Rms accent since they're not relevant to syllables.
"""
function antepenult(s)
    sylls = syllabify(s)
    if length(sylls) < 3
        @warn("penult: cannot extract antepenult from word with < 3 syllables: $s")
        nothing
    else
        sylls[end - 2]
    end
end

"""
True if `syll` is metrically long by nature.

$(SIGNATURES)

# Arguments

- `syll` is text for a single syllable
- `ortho` is a `GreekOrthography`

# Examples

```julia-repl
julia> PolytonicGreek.longsyllable("τει")
true
julia> PolytonicGreek.longsyllable("τε")
false
```
"""
function longsyllable(syll::AbstractString)
    # Sanity check:
    sylls = syllabify(syll)
    
    if (length(sylls) > 1)
        @warn("longsyllable: string $syll includes more than syllable.")
        nothing
    else
        vowels = rmaccents(syll) |> vowelsonly
        diphlist = split(LG_DIPHTHONGS, "|") 
        longies = split(LG_LONGVOWELS,"")
        
        vowels in diphlist || vowels in longies || vowels in lglongbynature()
    end
end



"""
True if `syll` counts as long for accent in ultima.

$(SIGNATURES)
"""
function finallong(syll::AbstractString)
    # Sanity check:
    sylls = syllabify(syll)
    
    if (length(sylls) > 1)
        @warn("finallong: string $syll includes more than syllable.")
        nothing
    else
        vowels = vowelsonly(syll)
        diphlist = split(LG_DIPHTHONGS, "|") 
        longies = split(LG_LONGVOWELS,"")
        
        if vowels in LG_FINALSHORT
            false
        else 
            vowels in diphlist || vowels in longies || vowels in lglongbynature()
        end
    end
end


"""
True if `syll` counts as short for accent in ultima.

$(SIGNATURES)
"""
function finalshort(syll::AbstractString)
    ! finallong(syll)
end

"""
True if `syll` is *not* long by nature.

$(SIGNATURES)

# Examples

```julia-repl
julia> PolytonicGreek.shortsyllable("ε")
true
julia> PolytonicGreek.shortsyllable("ει")
false
```

"""
function shortsyllable(syll::AbstractString)
    ! occursin(syll, "^")  && ! (longsyllable(syll))
end

"""
True if `s` contains a diphthong.

$(SIGNATURES)

# Examples

```julia-repl
julia> PolytonicGreek.includesdiphthong("εὐθύς")
true
julia> PolytonicGreek.includesdiphthong("ᾔα")
false
```
"""
function includesdiphthong(s::AbstractString)
    diphlist = split(LG_DIPHTHONGS, "|")
    for diph in diphlist
        if occursin(diph, s)
            return true
        end
    end
    false
end


"""
Convert grave accent to acute.   

$(SIGNATURES)
"""
function flipaccent(s)
    bare = stripquant(s)
    dict = flipdict()
    modified = []
    for c in nfkc(bare)
        if string(c) in keys(dict)
            flipped = dict[string(c)]
            push!(modified, flipped)
        else
            push!(modified, string(c)) 
        end
    end
    accented = join(modified,"")
    if occursin("_", s)
        string(accented, "_")
    else
        accented
    end
end 


"""
Remove all consonants from `s`.

$(SIGNATURES)

# Example

```julia-repl
julia> PolytonicGreek.vowelsonly("τῶν")
"ῶ"
```
"""
function vowelsonly(s::AbstractString)
    re = Regex("[$LG_CONSONANTS]")
    replace(s, re => "")
end

"""
    tokenaccent(s::AbstractString)
"""
function tokenform(s::AbstractString)
    stripenclitic(s) |> flipaccent
end

"""


"""
function countaccents(s::AbstractString)
    normed = Unicode.normalize(s, :NFKC)
    accents = 0
    repertoire = allaccents()
    for c in normed
        if string(c) in repertoire
            accents = accents + 1
        end
    end
    accents
end


"""
Remove any second enclitic accent from `s`.
"""
function stripenclitic(s::AbstractString)
    normed = Unicode.normalize(s, :NFKC)
    dict = accentstripdict()
    seen = 0
    repertoire = allaccents()
    modified = []
    for c in normed
        if string(c) in repertoire
            seen = seen + 1
            if seen == 2
                push!(modified, dict[c])
            elseif seen > 2
                @warn("stripenclitic: too many accents in $s")
                return nothing
            else
                push!(modified, c)
            end
        else
            push!(modified, c)
        end
    end
    join(modified,"")
end