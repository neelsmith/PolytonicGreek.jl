#=

Smyth:

- num syllables == num vowels/diphthongs
- 140a. single consonant goes with second syllables
- 140b. clusters of word begin or stop + liquid go -> second syllables
- 140c. Non-word begin split
- 140d. compounds divide etymologically
- 140e. sigmas are a mess
- 
=#

# Consonants
const CONSONANTS= "βγδζθκλμνξπρστφχψ"
const NONLIQUIDS = "βγδζθκλξπστφχψ"
const LIQUIDS = "μνρλ"

# Vowel classes:
# these are strings that can be used in a Regex
# class (in square brackets) to define a set of
# Characters
const SIMPLEVOWELS =  "αεηιου"
const DIAERESES = Unicode.normalize("ϊϋ",:NFKC)
const ROUGHVOWELS = Unicode.normalize("ἁἑἡἱὁὑὡ", :NFKC)
const SMOOTHVOWELS = Unicode.normalize("ἀἐἠἰὀὐὠ", :NFKC)
const IOTASUBS = Unicode.normalize("ᾳῃῳᾁᾑᾡᾀᾐᾠ", :NFKC)
const VOWELS = "$(SIMPLEVOWELS)$(SMOOTHVOWELS)$(ROUGHVOWELS)$(DIAERESES)"
const SHORTVOWELS = "εοἑἐὁὀ"
const LONGVOWELS = "ηωᾳἡὡᾁἠὠᾀ"

# diphthongs:
# this is a Regex disjunction for diphthongs:
const DIPHTHONGS = "αι|ει|οι|αυ|ευ|ου|ηυ|ωυ|υἰ|αἰ|εἰ|οἰ|αὐ|εὐ|οὐ|ηὐ|ωὐ|υἰ|αἱ|εἱ|οἱ|αὑ|εὑ|οὑ|ηὑ|ωὑ|υἱ"  

"""Diaeresis starts a new syllable."""
function splitdiaeresis(s)
    re = Regex("([$DIAERESES])")
    replace(s, re => s" \1") 
end

"""Consonant between two vowels goes with second vowel."""
function splitvcv(s)
    re = Regex("([$VOWELS])([$CONSONANTS])([$VOWELS])")
    replace(s, re => s"\1 \2\3")
end

"""Mu+nu stay together."""
function splitmunu(s)
    replace(s, "μν" => " μν")
end


"""Split between a liquid and non-liquid consonant."""
function splitliqcons(s)
    re = Regex("([$LIQUIDS])([$NONLIQUIDS])")
    replace(s, re => s"\1 \2")
end

function splitdiphthongvowel(s)
    re = Regex("($DIPHTHONGS)([$VOWELS])")
    replace(s, re => s"\1 \2")
end

function splitvoweldiphthong(s)
    re = Regex("([$VOWELS])($DIPHTHONGS)")
    replace(s, re => s"\1 \2")
    
end

function splitshortvowelvowel(s)
    re = Regex("([$SHORTVOWELS])([αεηοωᾳῃῳ])")
    replace(s, re => s"\1 \2")
end


function splitlongvowelvowel(s)
    re = Regex("([$LONGVOWELS])([$VOWELS])")
    replace(s, re => s"\1 \2")
end


function splitupsilonvowel(s)
    re = Regex("υ([$VOWELS])")
    replace(s, re => s"υ \1")
end

function splitdoubleconsonant(s)
    re = Regex("([$CONSONANTS])([$CONSONANTS])")
    replace(s, re => s"\1 \2")
end


function splitconsonantcluster(s)
    # TBA
    s
end

function splitcvc(s)
    re = Regex("([$CONSONANTS])([$VOWELS])([$CONSONANTS])")
    replace(s, re => s"\1\2 \3")
end


"""Split string `s` into an Array of strings representing syllables.
"""
function syllabify(s)
    Unicode.normalize(s, :NFKC) |>
    rmaccents  |>
    splitdiaeresis |> # √ προΐστημι breaks ο-ΐ
    splitmunu  |> # √
    splitliqcons |> # √
    splitdiphthongvowel |> # √
    splitvoweldiphthong |>  # √ 
    #=
    splitshortvowelvowel |> 
    splitlongvowelvowel |> 
    =#
    splitupsilonvowel |> 
    splitdoubleconsonant |> 
    splitvcv |> 
    split

end

