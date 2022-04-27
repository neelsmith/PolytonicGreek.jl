function lg_diphthongs()
    vcat(
        split(LG_DIPHTHONGS, "|"),
        split(LG_DIPHTHONGS_ACUTE, "|"),
        split(LG_DIPHTHONGS_CIRCUMFLEX, "|")
    )
end

"""True if `s` is a vowel or diphthong.
$(SIGNATURES)
"""
function vocalic(s::AbstractString)
    s in vcat(split(PolytonicGreek.LG_VOWELS,""), PolytonicGreek.allaccents(), lg_diphthongs())

end


"""True if `s` is a consonant.
$(SIGNATURES)
"""
function consonantal(s::AbstractString)
    contains(LG_CONSONANTS,s)
end

"""Return a pair of a (possibly empty) word stem, and 
a (possibly) string of consonants.
$(SIGNATURES)
# Example

"""
function trimconsonants(s::AbstractString)
    trailing = []
    stem = []
    sawvowel = false
    uglyphs = graphemes(s) |> collect |> reverse
    for g in uglyphs
        if vocalic(g)
            sawvowel = true
            push!(stem, g)
        elseif sawvowel
            push!(stem, g)
        elseif consonantal(g)
            push!(trailing, g)
        else
            push!(stem, g)
        end
    end
    (join(reverse(stem)), join(reverse(trailing)))
end




"""Return a pair of a (possibly empty) word stem, and 
a (possibly) string of vowels.
$(SIGNATURES)
# Example

"""
function trimvowels(s::AbstractString)
    trailing = []
    stem = []
    sawconsonant = false
    uglyphs = graphemes(s) |> collect |> reverse
    for g in uglyphs
        if consonantal(g)
            sawconsonant = true
            push!(stem, g)
        elseif sawconsonant
            push!(stem, g)
        elseif vocalic(g)
            push!(trailing, g)
        else
            push!(stem, g)
        end
    end
    (join(reverse(stem)), join(reverse(trailing)))
end


"""Extract vowel characters from last syllable of `s`.
$(SIGNATURES)
"""
function lastsyllvowels(s::AbstractString)
    (trimmed, consonants) = trimconsonants(s)
    (stem, vowelchars) = trimvowels(trimmed)
    vowelchars
end

function lg_accentedsyll(s::AbstractString)
    (trimmed, consonants) = trimconsonants(s)
    (stem, vowelchars) = trimvowels(trimmed)
    if accented(vowelchars)
        :ULTIMA
    else
        (trimmed2, cons2) =  trimconsonants(stem)
        (penult, penultvowels) = trimvowels(trimmed2)
        if accented(penultvowels)
            :PENULT
        else
            (trimmed3, cons3) =  trimconsonants(penult)
            (antepenult, antepenultvowels) = trimvowels(trimmed3)
            accented(antepenultvowels) ? :ANTEPENULT : :UNACCENTED
        end
    end

end