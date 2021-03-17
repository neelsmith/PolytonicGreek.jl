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


const DIAERESES = r"([ΐῒῗΰῢῧ])"
#const VCV = r"([$VOWELS])"
const CONSONANTS= "βγδζθκλμνξπρστφχψ"
const VOWELS = "αεηιουωᾳῃῳ" # And all the accentented combos...


function syllabify(s)
    s1 = replace(s, DIAERESES => s" \1") 
    replace(s1, r"([αεηιουωᾳῃῳ])([βγδζθκλμνξπρστφχψ])([αεηιουωᾳῃῳ])" => s"\1 \2\3")
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