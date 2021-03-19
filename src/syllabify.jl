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

"""Diaeresis starts a new syllable.

προΐστημι breaks as "προ ϊστημι"

"""
function splitdiaeresis(s)
    re = Regex("([$DIAERESES])")
    replace(s, re => s" \1") 
end




"""Mu+nu stay together.

ἀναμιμνησκόμενος breaks as "ἀναμι μνησκομενος"
"""
function splitmunu(s)
    replace(s, "μν" => " μν")
end


"""Split between a liquid and non-liquid consonant."""
function splitliqcons(s)
    re = Regex("([$LIQUIDS])([$NONLIQUIDS])")
    replace(s, re => s"\1 \2")
end


"""Split between a diphthong and following vowel.

κελεύει split as "κελευ ει"

"""
function splitdiphthongvowel(s)
    re = Regex("($DIPHTHONGS)([$VOWELS])")
    replace(s, re => s"\1 \2")
end

"""Split between a vowel and a following diphthong.

"οἰκι αις"

"""
function splitvoweldiphthong(s)
    re = Regex("([$VOWELS])($DIPHTHONGS)")
    replace(s, re => s"\1 \2")
    
end

"""Split between a short vowel and a following vowel.

δέομαι splits as "δε ομαι"

"""
function splitshortvowelvowel(s)
    re = Regex("([$POSSIBLESHORT$SHORTVOWELS])([αεηοωᾳῃῳ])")
    replace(s, re => s"\1 \2")
end

"""Split between a long vowel and a following vowel.

εἰσῄα splits as "εἰσῃ α"

"""
function splitlongvowelvowel(s)
    re = Regex("([$LONGVOWELS])([$VOWELS])")
    replace(s, re => s"\1 \2")
end


"""Split between upsilon and a following vowel.

θύειν splits as "θυ ειν"

"""
function splitupsilonvowel(s)
    re = Regex("υ([$VOWELS])")
    replace(s, re => s"υ \1")
end

"""Split between doubled consonants.

καταβάλλω splits as "καταβαλ λω"
"""
function splitdoubleconsonant(s)
    re = Regex("([$CONSONANTS]){2}")
    replace(s, re => s"\1 \1")
end


function splitconsonantcluster(s)
    re = Regex("([$VOWELS])([βγδζθκπξστφχψ][μνβγδζθκλξπρστφχψ])")
    replace(s, re => s"\1 \2")
end



"""Consonant between two vowels goes with second vowel."""
function splitvcv(s)
    re = Regex("([$VOWELS])([$CONSONANTS])([$VOWELS])")
    replace(s, re => s"\1 \2\3")
end

"""Split string `s` into an Array of strings representing syllables.
"""
function syllabify(s)
    Unicode.normalize(s, :NFKC) |>
    rmaccents  |>
    splitdiaeresis |> 
    splitmunu  |> 
    splitliqcons |> 
    splitdiphthongvowel |> 
    splitvoweldiphthong |>  
    splitshortvowelvowel |> 
    splitlongvowelvowel |> 
    splitupsilonvowel |> 
    splitdoubleconsonant |> 
    splitvcv |>   splitvcv |> # catch overlap
    split
end

