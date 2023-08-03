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

"""
Diaeresis starts a new syllable.

$(SIGNATURES)

προΐστημι breaks as "προ ϊστημι"

"""
function splitdiaeresis(s)
    re = Regex("([$LG_DIAERESES])")
    replace(s, re => s" \1") 
end



"""Mu+nu stay together.

$(SIGNATURES)

ἀναμιμνησκόμενος breaks as "ἀναμι μνησκομενος"
"""
function splitmunu(s)
    replace(s, "μν" => " μν")
end

"""Split between a liquid and non-liquid consonant."""
function splitliqcons(s)
    
    rholambda = Regex("([ρλ])([$LG_LIQUIDS])")
    splitrholambda = replace(s, rholambda => s"\1 \2")
    re = Regex("([$LG_LIQUIDS])([$LG_NONLIQUIDS])(.+)")
    answer = replace(splitrholambda, re => s"\1 \2\3")
    if s !=  answer
        @debug("Split liqcons on $(s) to $(answer)")
    end
    answer
end


"""$(SIGNATURES)

Split between a diphthong and following vowel.

# Example
```jldoctest
PolytonicGreek.splitdiphthongvowel("κελεύει")
"κελευ ει"
```
"""
function splitdiphthongvowel(s)
    re = Regex("($LG_DIPHTHONGS)([$LG_VOWELS])")
    replace(s, re => s"\1 \2")
end

"""Split between a vowel and a following diphthong.

"οἰκι αις"

"""
function splitvoweldiphthong(s)
    re = Regex("([$LG_VOWELS]|$LG_MACRA)($LG_DIPHTHONGS)")
    replace(s, re => s"\1 \2")
    
end

"""Split between a short vowel and a following vowel.

δέομαι splits as "δε ομαι"

"""
function splitshortvowelvowel(s)
    re = Regex("([$LG_AMBIGUOUSVOWELS$LG_SHORTVOWELS])([αεηοωᾳῃῳ])")
    split1 = replace(s, re => s"\1 \2")
    split2 = replace(split1, r"([ιἰἱ])([υι])" => s"\1 \2")
    replace(split2, r"([υὐὑ])υ" => s"\1 υ")
end

"""Split between a long vowel and a following vowel.

εἰσῄα splits as "εἰσῃ α"

"""
function splitlongvowelvowel(s)
    re = Regex("([$LG_LONGVOWELS]|$LG_MACRA)([$LG_VOWELS])")
    replace(s, re => s"\1 \2")
end


"""Split between upsilon and a following vowel other than iota.

θύειν splits as "θυ ειν"

"""
function splitupsilonvowel(s)
    upsilonbreakers = "αεουηωᾳῃῳ"
    re = Regex("υ([$upsilonbreakers])")
    replace(s, re => s"υ \1")
end

"""Split between doubled consonants.

καταβάλλω splits as "καταβαλ λω"
"""
function splitdoubleconsonants(s)
    replace(s, r"([βγδζθκλμνξπρστφχψ])(?=\1+)" => s"\1 ")
end


function splitconsonantcluster(s)
    re = Regex("([$LG_VOWELS]|$LG_MACRA)([βγδζθκπξστφχψ][μνβγδζθκλξπρστφχψ])")
    replace(s, re => s"\1 \2")

end



"""Consonant between two vowels goes with second vowel."""
function splitvcv(s)
    re = Regex("([$LG_VOWELS]|$LG_MACRA)([$LG_CONSONANTS])([$LG_VOWELS])")
    replace(s, re => s"\1 \2\3")
end

"""Split string `s` into an Array of strings representing syllables.

$(SIGNATURES)

# Example
```jldoctest
syllables = PolytonicGreek.syllabify("κελεύει")
join(syllables, "-")
"κε-λευ-ει"
```

"""
function syllabify(s, ortho::LiteraryGreekOrthography)
    morpheme_v =nfkc(s) |>
    rmaccents |>
    splitmorphemes 

    map(morpheme_v) do s
        s |> splitdiaeresis |> 
        splitmunu  |> 
        splitliqcons |>    splitliqcons |>   splitliqcons |>   splitliqcons |>
        splitdiphthongvowel |> 
        splitvoweldiphthong |>  
        splitshortvowelvowel |>  splitshortvowelvowel |>  # catch overlap
        splitlongvowelvowel |> splitlongvowelvowel |>  # catch overlap
        splitupsilonvowel |> 
        splitdoubleconsonants |> 
        splitconsonantcluster |>
        splitvcv |>   splitvcv |> # catch overlap
      
        split 
     
    end  |> Iterators.flatten |> collect
    
end

