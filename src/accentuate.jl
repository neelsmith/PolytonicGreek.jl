# Manipulate accents.

# Published functions

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


function accentsyllable(syll::AbstractString, accent::Symbol)
    if placement == :ACUTE
        wrd
    elseif placement == :CIRCUMFLEX
        wrd
    else
        @warn("accentsyllable: value of placement was neither :ACUTE nor :CIRCUMFLEX.")
    end
end

function  accentword(wrd::AbstractString, placement::Symbol)
    if placement == :PENULT
        wrd
    elseif placement == :RECESSIVE
        wrd
    else
        @warn("accentword: value of placement was neither :PENULT nor :RECESSIVE.")
    end
end


"""
    flipaccent(s)

Convert grave accent to acute.    
"""
function flipaccent(s)
    s
end 

"""
    tokenaccent(s::AbstractString)
"""
function tokenaccent(s::AbstractString)
    stripenclitic(s) |> flipaccent
end



# Private functions
function longsyllable(syll)
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

        println("VOWELS: ", vowelsonly)
        println("DIPH? ", (vowelsonly in diphlist))
        println("LONG BY N ATURE? ", (vowelsonly in longies))
        vowelsonly in diphlist || vowelsonly in longies
    end
end

function shortsyllable(syll)
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

