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
const LIQUIDS = "μνρλ"

function splitdiaeresis(s)
    re = Regex("([$DIAERESES])")
    replace(s, re => s" \1") 
end

function splitvcv(s)
    re = Regex("([$VOWELS])([$CONSONANTS])([$VOWELS])")
    replace(s, re => s"\1 \2\3")
end

function splitmunu(s)
    replace(s, "μν" => " μν")
end

function splitliqcons(s)
    re = Regex("([$LIQUIDS])([$CONSONANTS])")
    replace(s, re => s"\1 \2")
end

function splitdiphthongvowel(s)
    # TBA
    s
end

function splitvoweldiphthong(s)
    # TBA
    s
end

function splitshortvowelvowel(s)
    # TBA
    s
end


function splitlongvowelvowel(s)
    # TBA
    s
end


function splitupsilonvowel(s)
    # TBA
    s
end

function splitdoubleconsonant(s)
    # TBA
    s
end


function splitconsonantcluster(s)
    # TBA
    s
end

function splitcvc(s)
    # TBA
    s
end


"""Split string `s` into an Array of strings representing syllables.
"""
function syllabify(s)
    cleaner = Unicode.normalize(s, :NFKC)
    splitdiaeresis(cleaner) |> 
    splitvcv |> 
    splitmunu  |>
    splitliqcons |> 
    splitdiphthongvowel |>
    splitvoweldiphthong |>  
    splitshortvowelvowel |> 
    splitlongvowelvowel |> 
    splitupsilonvowel |> 
    splitdoubleconsonant |> 
    splitconsonantcluster |> 
    splitcvc |> 
    split
end


#=

def testMap = [
"poios"  : "poi#os",
"o)i+w" : "o)#i+#w",
"pwu+" : "pw#u+",
"oi)w" : "oi)#w",

"a)nqos" : "a)n#qos",
"e)lpis" : "e)l#pis",
"e)rgma" : "e)r#gma",
"a)ei" : "a)#ei",
"dia" : "di#a",
"die" : "di#e",
"eu)+" : "e#u)+",
"r(ea" : "r(e#a",
"pragma" : "pra#gma",
"sui+" : "su#i+",
"tiw" :  "ti#w",
"r(a" : "r(a",
"oi(o" : "oi(#o",
"a)asamhn": "a)#a#sa#mhn",
"e)u+" : "e)#u+",
"ou(tos" : "ou(#tos",
"dw|h" : "dw|#h",
"eu+n" : "e#u+n",
"a)ll'": "a)ll'",
"a)mf'" : "a)mf'",
"e)aa|" : "e)#a#a|",
"h)u+s" : "h)#u+s",
"h)i+e" : "h)#i+#e",
"kien" : "ki#en",
"kion" : "ki#on",
"ui(ei+" : "ui(#e#i+",
"xiwn"  : "xi#wn",
"a)u+th" : "a)#u+#th",
"lu_e" : "lu_#e",
"a)nalu_w": "a)#na#lu_#w",
"is" : "is",
"ios" : "i#os",
"ni_ke": "ni_#ke",
"e)gegra^pto" : "e)#ge#gra^#pto"
]
=#