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


const DIAERESES = Unicode.normalize("ΐῒῗΰῢῧϊϋ",:NFKC)
const CONSONANTS= "βγδζθκλμνξπρστφχψ"
const VOWELS = "αεηιουωᾳῃῳ$(DIAERESES)" # And all the accentented combos...

function splitdiaeresis(s)
    re = Regex("([$DIAERESES])")
    replace(s, re => s" \1") 
end

function splitvcv(s)
    re = Regex("([$VOWELS])([$CONSONANTS])([$VOWELS])")
    replace(s, re => s"\1 \2\3")
end


"""Split string `s` into an Array of strings representing syllables.
"""
function syllabify(s)

    splitdiaeresis(Unicode.normalize(s, :NFKC)) |> splitvcv |> split
end
#=
from gsphone library in Scala:

    √ val dia = splitOnDiaeresis(strVector)

    val mn = splitOnMuNu(dia)
    val lc = splitOnLiqCons(mn)
    val dv = splitOnDiphthVowel(lc)
    val vd = splitOnVowelDiphth(dv)
    val shrtVwl = splitOnShortVowelVowel(vd)
    val lngVwl = splitOnLongVowelVowel(shrtVwl)
    val uVwl = splitOnUpsilonVowel(lngVwl)

    val dblCons = splitOnDoubleCons(uVwl)
    // Make consonant clusters smarter?
    val conss = splitOnConsCluster(dblCons)
    splitOnVCV(conss)

=#    