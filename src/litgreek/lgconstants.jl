
# Consonants
const LG_CONSONANTS= "βγδζθκλμνξπρστφχψς"
const LG_NONLIQUIDS = "βγδζθκλξπστφχψς"
const LG_LIQUIDS = "μνρλ"
const LG_INITIALRHO = nfkc("ῥ")

# Vowel classes:
# these are strings that can be used in a Regex
# class (in square brackets) to define a set of
# Characters
const LG_SIMPLEVOWELS =  "αεηιουω'" # Include elision mark as a vowel
const LG_DIAERESES = nfkc("ϊϋ")
const LG_ROUGHVOWELS = nfkc("ἁἑἡἱὁὑὡ")
const LG_SMOOTHVOWELS = nfkc("ἀἐἠἰὀὐὠ")
const LG_IOTASUBS = nfkc("ᾳῃῳᾁᾑᾡᾀᾐᾠ")
const LG_VOWELS = nfkc("$(LG_SIMPLEVOWELS)$(LG_SMOOTHVOWELS)$(LG_ROUGHVOWELS)$(LG_DIAERESES)$(LG_IOTASUBS)")
const LG_SHORTVOWELS = nfkc("εοἑἐὁὀ")
const LG_AMBIGUOUSVOWELS = nfkc("αιυἀἰὐἁἱὑϊϋ")
const LG_LONGVOWELS = nfkc("ηῃωῳᾳἡᾑὡᾡᾁἠᾐὠᾠᾀ")



"""Compose a list of all possible vowels with breathing or diaeresis that could
be qualified by a long-vowel marker.

$(SIGNATURES)
"""
function lglongbynature() 
    macra = []
    for c in LG_AMBIGUOUSVOWELS
        push!(macra,string(c,"_"))
    end
    macra
end


# diphthongs:
# this is a Regex disjunction for diphthongs:
const LG_DIPHTHONGS = "αι|ει|οι|υι|αυ|ευ|ου|ηυ|ωυ|υἰ|αἰ|εἰ|οἰ|αὐ|εὐ|οὐ|ηὐ|ωὐ|υἰ|αἱ|εἱ|οἱ|αὑ|εὑ|οὑ|ηὑ|ωὑ|υἱ"  
const LG_DIPHTHONGS_ACUTE = 
"αί|εί|οί|υί|αύ|εύ|ού|ηύ|ωύ|υἴ|αἴ|εἴ|οἴ|αὔ|εὔ|οὔ|ηὔ|ωὔ|υἴ|αἵ|εἵ|οἵ|αὕ|εὕ|οὕ|ηὕ|ωὕ|υἵ" 
const LG_DIPHTHONGS_CIRCUMFLEX = 
"αῖ|εῖ|οῖ|υῖ|αῦ|εῦ|οῦ|ηῦ|ωῦ|υἶ|αἶ|εἶ|οἶ|αὖ|εὖ|οὖ|ηὖ|ωὖ|υἶ|αἷ|εἷ|οἷ|αὗ|εὗ|οὗ|ηὗ|ωὗ|υἷ" 
const LG_FINALSHORT = ["αι", "οι"]



function lgmacra()
    addmarks = map(v -> v * "_", split(LG_AMBIGUOUSVOWELS,""))
    join(addmarks,"|")
end

# this is a Regex disjunction for two-character strings of 
# ambiguous vowel plus explicit macron:
const LG_MACRA = lgmacra()
