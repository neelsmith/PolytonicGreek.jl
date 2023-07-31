# Functions for manipulating accents.
"""Implement GreekOrthography's dropsecondaccent function for LiteraryGreekOrthography.

    $(SIGNATURES)
    """
function dropsecondaccent(s::AbstractString, ortho::LiteraryGreekOrthography)
    stripped = []
    accentseen = false
    reply = if countaccents(s,ortho) > 1
        dict = accentstripdict(ortho)
        for c in reverse(nfkc(s))
            if accentseen == false && c in keys(dict)
                push!(stripped, dict[c])
                accentseen = true
            else
                push!(stripped,c)
            end
        end
        join(reverse(stripped),"")
    else
        s
    end
end


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
function addacute(vowel::AbstractString, ortho::OrthographicSystem=literaryGreek())
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
        @warn("addacute: can't add acute accent to vowel $vowel")
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
function addcircumflex(vowel::AbstractString, ortho::OrthographicSystem=literaryGreek())
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
function accentsyllable(syll::AbstractString, accent::Symbol, ortho::LiteraryGreekOrthography = literaryGreek())
    # Check that syll is only one syllable
    sylls = syllabify(syll, ortho)
    if length(sylls) > 1
        @warn("accentsyllable: string $syll is more than one syllable.")
        nothing
    else
        vowels = vowelsonly(lowercase(syll), ortho)
        barevowels = stripquant(vowels)

        if accent == :ACUTE
            accentedvowel = addacute(barevowels, ortho)
            if occursin("_", vowels)
                rplcmnt = string(accentedvowel,"_")
                replace(syll, string(barevowels,"_") => rplcmnt)
            else 
                replace(syll, barevowels => accentedvowel)
            end

        elseif accent == :CIRCUMFLEX
            accentedvowel = addcircumflex(barevowels, ortho)
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
function accentultima(wrd::AbstractString, accent::Symbol, ortho::LiteraryGreekOrthography = literaryGreek())
    sylls = syllabify(wrd, ortho)
    sylls[end] = accentsyllable(ultima(wrd, ortho), accent)
    join(sylls,"")
end

"""Place accent on penult.

$(SIGNATURES)
"""
function accentpenult(wrd::AbstractString, accent::Symbol, ortho::LiteraryGreekOrthography = literaryGreek())
    sylls = syllabify(wrd, ortho)
    if length(sylls) < 2
        @warn("accentpenult: can't accent word with fewer than two syllables $wrd")
        nothing
    else
        sylls[end - 1] = accentsyllable(penult(wrd, ortho), accent)
        join(sylls,"")
    end
end

"""Place default accent(:ACUTE) on antepenult.

$(SIGNATURES)
"""
function accentantepenult(wrd::AbstractString, ortho::LiteraryGreekOrthography)
    sylls = syllabify(wrd)
    if length(sylls) < 3
        @warn("accentantepenult: can't accent word with fewer than three syllables $wrd")
        nothing
    else
        sylls[end - 2] = accentsyllable(antepenult(wrd, ortho), :ACUTE)
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
function accentword(wrd::AbstractString, placement::Symbol, ortho::LiteraryGreekOrthography = literaryGreek())
    sylls = syllabify(wrd, ortho)
    @info("Syllabify $(wrd) to $(sylls)")
    ult = ultima(wrd, ortho)
    if placement == :PENULT    
        if length(sylls) < 2
            @warn("accentword: cannot accent $wrd on penult since it does not have two syllables.")
            nothing
        else
            pnlt = penult(wrd, ortho)
            if longsyllable(pnlt, ortho) && finalshort(ult, ortho)
                accentpenult(wrd, :CIRCUMFLEX, ortho)
            else
                accentpenult(wrd, :ACUTE, ortho)
            end
        end
         
    elseif placement == :RECESSIVE
        if length(sylls) == 1
            accentultima(wrd, :ACUTE)
            
        elseif length(sylls) < 2
            @warn("accentword: string $wrd has fewer than 2 syllables.")
            nothing
        else
            if length(sylls) == 2
                accentword(wrd, :PENULT)

            elseif finallong(ult, ortho)
                accentpenult(wrd, :ACUTE)

            else
                accentantepenult(wrd, ortho)
            end
        end
     
    else
        @warn("accentword: value of placement was neither :PENULT nor :RECESSIVE.")
    end
end



"""Return ultima.

$(SIGNATURES)
"""
function ultima(s, ortho::LiteraryGreekOrthography)
    sylls = syllabify(s, ortho)
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
function penult(s, ortho::LiteraryGreekOrthography)
    sylls = syllabify(s, ortho)
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
function antepenult(s, ortho::LiteraryGreekOrthography)
    sylls = syllabify(s, ortho)
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
function longsyllable(syll::AbstractString, ortho::LiteraryGreekOrthography)
    # Sanity check:
    sylls = syllabify(syll, ortho)
    
    if (length(sylls) > 1)
        @warn("longsyllable: string $syll includes more than syllable.")
        nothing
    else
        noaccs = rmaccents(syll, ortho)
        vowels = vowelsonly(noaccs, ortho)
        diphlist = split(LG_DIPHTHONGS, "|") 
        longies = split(LG_LONGVOWELS,"")
        
        vowels in diphlist || vowels in longies || vowels in lglongbynature()
    end
end



"""
True if `syll` counts as long for accent in ultima.

$(SIGNATURES)
"""
function finallong(syll::AbstractString, ortho::LiteraryGreekOrthography)
    # Sanity check:
    sylls = syllabify(syll, ortho)
    
    if (length(sylls) > 1)
        @warn("finallong: string $syll includes more than syllable.")
        nothing

    elseif endswith(syll, "οι") || endswith(syll, "αι")
        false
    else
        vowels = vowelsonly(syll, ortho)
        diphlist = split(LG_DIPHTHONGS, "|") 
        longies = split(LG_LONGVOWELS,"")
        #=
        if vowels in LG_FINALSHORT
            false
        else =#
        vowels in diphlist || vowels in longies || vowels in lglongbynature()
        #end
    end
end


"""
True if `syll` counts as short for accent in ultima.

$(SIGNATURES)
"""
function finalshort(syll::AbstractString, ortho::LiteraryGreekOrthography)
    ! finallong(syll, ortho)
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
function shortsyllable(syll::AbstractString, ortho::LiteraryGreekOrthography)
    ! occursin(syll, "^")  && ! (longsyllable(syll, ortho))
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
function flipaccent(s, ortho::LiteraryGreekOrthography)
    dict = flipdict(ortho)
    modified = []
    for c in nfkc(s)
        if string(c) in keys(dict)
            flipped = dict[string(c)]
            push!(modified, flipped)
        else
            push!(modified, string(c)) 
        end
    end
    accented = join(modified,"")
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
function vowelsonly(s::AbstractString, ortho::LiteraryGreekOrthography)
    norho =  replace(s, LG_INITIALRHO => "")
    re = Regex("[$LG_CONSONANTS]")
    replace(norho, re => "")
end

"""

"""
function tokenform(s::AbstractString, ortho::LiteraryGreekOrthography)
    stripped = stripenclitic(s, ortho) 
    flipaccent(stripped, ortho)
end

"""Counts number of accents in `s`.
$(SIGNATURES)
"""
function countaccents(s::AbstractString, ortho::LiteraryGreekOrthography)
    normed = Unicode.normalize(s, :NFKC)
    accents = 0
    repertoire = allaccents(ortho)
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
function stripenclitic(s::AbstractString, ortho::LiteraryGreekOrthography)
    normed = Unicode.normalize(s, :NFKC)
    dict = accentstripdict(ortho)
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


"""True if `s` has at least one accent.
$(SIGNATURES)
"""
function accented(s::AbstractString)
    countaccents(s) > 0
end