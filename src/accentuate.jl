# Functions for manipulating accents.

"""
    rmaccents(s::AbstractString

Remove all accent characters from `s`.
"""
function rmaccents(s::AbstractString)
    stripped = []
    dict = accentdict()
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
    dict = Dict(
        [
            "α" => "ά",
            "ε" => "έ",
            "ι" => "ί",
            "ο" => "ό",
            "υ" => "ύ",
            "η" => "ή",
            "ω" => "ώ",
    
            "ἀ" => "ἄ",
            "ἐ" => "ἔ",
            "ἰ" => "ἴ",
            "ὀ" => "ὄ",
            "ὐ" => "ὔ",
            "ἠ" => "ἤ",
            "ὤ" => "ὤ",
    
            "ἁ" => "ἅ",
            "ἑ" => "ἕ",
            "ἱ" => "ἵ",
            "ὁ" => "ὅ",
            "ὑ" => "ὕ",
            "ἡ" => "ἥ",
            "ὡ" => "ὥ", 
    
            # iota subs
            "ᾳ" => "ᾴ",
            "ῃ" => "ῄ",
            "ῳ" => "ῴ",
    
            "ᾀ" => "ᾄ",
            "ᾐ" => "ᾔ",
            "ᾠ" => "ᾤ",
    
            "ᾁ" => "ᾅ",
            "ᾑ" => "ᾕ",
            "ᾡ" => "ᾥ", 
    
            # diaereses
            "ϊ" => "ΐ",
            "ϋ" => "ΰ",
    
            # diphthongs
            "αι" => "αί",
            "ει" => "εί",
            "οι" => "οί",
            "υι" => "υί",
            "αυ" => "αύ",
            "ευ" => "εύ",
            "ου" => "ού",
            "ηυ" => "ηύ",
            "ωυ" => "ωύ",
            "υι" => "υί",
            "αἰ" => "αἴ",
            "εἰ" => "εἴ",
            "οἰ" => "οἴ",
            "αὐ" => "αὔ",
            "εὐ" => "εὔ",
            "οὐ" => "οὔ",
            "ηὐ" => "ηὔ",
            "ωὐ" => "ωὔ",
            "υἰ" => "υἴ",
            "αἱ" => "αἵ",
            "εἱ" => "εἵ",
            "οἱ" => "οἵ",
            "αὑ" => "αὕ",
            "εὑ" => "εὕ",
            "οὑ" => "οὕ",
            "ηὑ" => "ηὕ",
            "ωὑ" => "ωὕ",
            "υἱ" => "υἵ"
        ]
    )

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
    dict = Dict(
        [
            "α" => "ᾶ",
            "ι" => "ῖ",
            "υ" => "ῦ",
            "η" => "ῆ",
            "ω" => "ῶ",
    
            "ἀ" => "ἆ",
            "ἰ" => "ἶ",
            "ὐ" => "ὖ",
            "ἠ" => "ἦ",
            "ὤ" => "ὦ",
    
            "ἁ" => "ἇ",
            "ἱ" => "ἷ",
            "ὑ" => "ὗ",
            "ἡ" => "ἧ",
            "ὡ" => "ὧ", 
    
            # iota subs
            "ᾳ" => "ᾷ",
            "ῃ" => "ῇ",
            "ῳ" => "ῷ",
    
            "ᾀ" => "ᾆ",
            "ᾐ" => "ᾖ",
            "ᾠ" => "ᾦ",
    
            "ᾁ" => "ᾇ",
            "ᾑ" => "ᾗ",
            "ᾡ" => "ᾧ", 
    
            # diaereses
            "ϊ" => "ῗ",
            "ϋ" => "ῧ",
    
            # diphthongs
            "αι" => "αῖ",
            "ει" => "εῖ",
            "οι" => "οῖ",
            "υι" => "υῖ",
            "αυ" => "αῦ",
            "ευ" => "εῦ",
            "ου" => "οῦ",
            "ηυ" => "ηῦ",
            "ωυ" => "ωῦ",
            "υι" => "υῖ",
            "αἰ" => "αἶ",
            "εἰ" => "εἶ",
            "οἰ" => "οἶ",
            "αὐ" => "αὖ",
            "εὐ" => "εὖ",
            "οὐ" => "οὖ",
            "ηὐ" => "ηὖ",
            "ωὐ" => "ωὖ",
            "υἰ" => "υἶ",
            "αἱ" => "αἷ",
            "εἱ" => "εἷ",
            "οἱ" => "οἷ",
            "αὑ" => "αὗ",
            "εὑ" => "εὗ",
            "οὑ" => "οὗ",
            "ηὑ" => "ηὗ",
            "ωὑ" => "ωὗ",
            "υἱ" => "υἷ"
    
        ]
    )

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
        re = Regex("[$CONSONANTS]")
        vowelsonly = replace(syll, re => "" )

        if accent == :ACUTE
            replace(syll, vowelsonly => addacute(vowelsonly))
        elseif accent == :CIRCUMFLEX
            replace(syll, vowelsonly => addcircumflex(vowelsonly))
        else
            @warn("accentsyllable: value of accent was neither :ACUTE nor :CIRCUMFLEX.")
        end
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
            accentedsyll =  ""
            if longsyllable(ult)
                accentedsyll = accentsyllable(pnlt, :ACUTE)
            else
                if longsyllable(pnlt)
                    accentedsyll = accentsyllable(pnlt, :CIRCUMFLEX)
                else
                    accentedsyll = accentsyllable(pnlt, :ACUTE)
                end
            end
            sylls[end - 1] = accentedsyll
            join(sylls,"")
        end
         
    elseif placement == :RECESSIVE
        if length(sylls) < 2
            @warn("accentword: string $wrd has fewer than 2 syllables.")
            nothing
        else
            if length(sylls) == 2
                accentword(wrd, :PENULT)

            elseif longsyllable(ult)
                accentword(wrd, :PENULT)

            else
                ante = antepenult(wrd)
                sylls[end - 2] = accentsyllable(ante, :ACUTE)
                join(sylls, "")
            end
        end
     
    else
        @warn("accentword: value of placement was neither :PENULT nor :RECESSIVE.")
    end
end


######################################
# Functions private to package:


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
    flipaccent(s)

Convert grave accent to acute.    
"""
function flipaccent(s)
    nothing
end 

"""
    tokenaccent(s::AbstractString)
"""
function tokenaccent(s::AbstractString)
    stripenclitic(s) |> flipaccent
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
        re = Regex("[$CONSONANTS]")
        vowelsonly = replace(syll, re => "")
        diphlist = split(DIPHTHONGS, "|") 
        longies = split(LONGVOWELS,"")
        #println("VOWELS: ", vowelsonly)
        #println("DIPH? ", (vowelsonly in diphlist))
        #println("LONG BY N ATURE? ", (vowelsonly in longies))
        vowelsonly in diphlist || vowelsonly in longies
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
    stripenclitic(s::AbstractString)

Remove any second enclitic accent from `s`.
"""
function stripenclitic(s::AbstractString)
    nothing
end

