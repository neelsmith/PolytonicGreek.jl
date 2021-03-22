# Functions for manipulating accents.

"""
    rmaccents(s::AbstractString

Remove all accent characters from `s`.
"""
function rmaccents(s::AbstractString)
    stripped = []
    dict = accentstripdict()
    for c in Unicode.normalize(s, :NFKC)
        if c in keys(dict)
            push!(stripped, dict[c])
        else
            push!(stripped,c)
        end
    end
    join(stripped,"")
end

"""
    addacute(vowel::AbstractString

Add an acute accent to a single vowel or diphthong.

```julia-repl
julia> PolytonicGreek.addacute("ᾀ")
"ᾄ"
julia> PolytonicGreek.addacute("τα")
┌ Warning: addacute: can't add acute accent to vowel τα
```
"""
function addacute(vowel::AbstractString)
    dict = acutedict()
    if vowel in keys(dict)
        dict[vowel]
    else
        @warn("addacute: can't add acute accent to vowel $vowel")
        nothing
    end
end


"""
    addcircumflex(vowel::AbstractString)

Add a circumflex accent to a single vowel or diphthong

Examples:
```julia-repl
julia> PolytonicGreek.addcircumflex("ᾀ")
"ᾆ"
julia> PolytonicGreek.addcircumflex("τα")
┌ Warning: addcircumflex: can't add circumflex accent to vowel τα
```
"""
function addcircumflex(vowel::AbstractString)
    dict = circumflexdict() 
    if vowel in keys(dict)
        dict[vowel]
    else
        @warn("addcircumflex: can't add circumflex accent to vowel $vowel")
        nothing
    end
end

"""
    accentsyllable(syll::AbstractString, accent::Symbol)

Add specified accent to a single syllable.  
`syll` is a string value for a single syllable.
`accent` is either `:ACUTE` or `:CIRCUMFLEX`.  The
function returns `nothing` for any other symble for accent.

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
    # Check that only one syllable
    sylls = syllabify(syll)
    if length(sylls) > 1
        @warn("accentsyllable: string $syll is more than one syllable.")
        nothing
    else
        vowels = vowelsonly(syll)

        if accent == :ACUTE
            replace(syll, vowels => addacute(vowels))
        elseif accent == :CIRCUMFLEX
            replace(syll, vowels => addcircumflex(vowels))
        else
            @warn("accentsyllable: value of accent was neither :ACUTE nor :CIRCUMFLEX.")
        end
    end
end

function accentultima(wrd::AbstractString, accent::Symbol)
    sylls = syllabify(wrd)
    sylls[end] = accentsyllable(ultima(wrd), accent)
    join(sylls,"")
end

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
    accentword(wrd::AbstractString, placement::Symbol)

Accent word according to specified system of accent placement.
`wrd` is a string value representing a single lexical token.
`placement` is one of `:RECESSIVE` for recessive accent 
or `:PENULT` for persistent accent on the penultimate syllable.
Note that it is not possible to accent the ultima correctly without
additional morphological information beyond the string value of the token.

Examples:
```julia-repl

```
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
            if longsyllable(pnlt) && shortsyllable(ult)
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

            elseif longsyllable(ult)
                accentpenult(wrd, :ACUTE)

            else
                accentantepenult(wrd)
            end
        end
     
    else
        @warn("accentword: value of placement was neither :PENULT nor :RECESSIVE.")
    end
end




function ultima(s)
    sylls = syllabify(s)
    if isempty(sylls)
        @warn("ultima: no syllables in string $s")
        nothing
    else
        sylls[end]
    end
end

function penult(s)
    sylls = syllabify(s)
    if length(sylls) < 2
        @warn("penult: cannot extract penult from word with < 2 syllables: $s")
        nothing
    else
        sylls[end - 1]
    end
end

"""
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
    longsyllable(syll::AbstractString)

True if `syll` is metrically long by nature.

Examples:

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
        vowels = vowelsonly(syll)
        diphlist = split(DIPHTHONGS, "|") 
        longies = split(LONGVOWELS,"")
        vowels in diphlist || vowels in longies
    end
end

"""
    shortsyllable(syll::AbstractString)

True if `syll` is *not* long by nature.
Examples:

```julia-repl
julia> PolytonicGreek.shortsyllable("ε")
true
julia> PolytonicGreek.shortsyllable("ει")
false
```

"""
function shortsyllable(syll::AbstractString)
    ! (longsyllable(syll))
end

"""
    includesdiphthong(s::AbstractString)

True if `s` contains a diphthong.

Examples:

```julia-repl
julia> PolytonicGreek.includesdiphthong("εὐθύς")
true
julia> PolytonicGreek.includesdiphthong("ᾔα")
false
```
"""
function includesdiphthong(s::AbstractString)
    diphlist = split(DIPHTHONGS, "|")
    for diph in diphlist
        if occursin(diph, s)
            return true
        end
    end
    false
end


"""
    flipaccent(s)

Convert grave accent to acute.    
"""
function flipaccent(s)
    sylls = syllabify(s)
    vowels = vowelsonly(sylls[end])
    dict = flipdict()
    if vowels in keys(dict)
        sylls[end] = replace(s, vowels => dict[s])
        join(sylls,"")
    else
        s
    end
end 


"""
    vowelsonly(s::AbstractString)

Remove all consonants from `s`.

Example:

```julia-repl
julia> PolytonicGreek.vowelsonly("τῶν")
"ῶ"
```
"""
function vowelsonly(s::AbstractString)
    re = Regex("[$CONSONANTS]")
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
    stripenclitic(s::AbstractString)

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