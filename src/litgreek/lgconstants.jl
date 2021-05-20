
# Consonants
const LG_CONSONANTS= "βγδζθκλμνξπρστφχψς"
const LG_NONLIQUIDS = "βγδζθκλξπστφχψς"
const LG_LIQUIDS = "μνρλ"

# Vowel classes:
# these are strings that can be used in a Regex
# class (in square brackets) to define a set of
# Characters
const LG_SIMPLEVOWELS =  "αεηιουω"
const LG_DIAERESES = nfkc("ϊϋ")
const LG_ROUGHVOWELS = nfkc("ἁἑἡἱὁὑὡ")
const LG_SMOOTHVOWELS = nfkc("ἀἐἠἰὀὐὠ")
const LG_IOTASUBS = nfkc("ᾳῃῳᾁᾑᾡᾀᾐᾠ")
const LG_VOWELS = "$(LG_SIMPLEVOWELS)$(LG_SMOOTHVOWELS)$(LG_ROUGHVOWELS)$(LG_DIAERESES)$(LG_IOTASUBS)"
const LG_SHORTVOWELS = nfkc("εοἑἐὁὀ")
const LG_POSSIBLESHORT = nfkc("αιἀἰἁἱϊ")
const LG_LONGVOWELS = nfkc("ηῃωῳᾳἡᾑὡᾡᾁἠᾐὠᾠᾀ")
const LG_AMBIGUOUSVOWELS = nfkc("αιυἀἰὐἁἱὑϊϋ")

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
const LG_FINALSHORT = ["αι", "οι"]

"""True if `s` is a string representing the vowel alpha.

$(SIGNATURES)
"""
function alpha(s::AbstractString) 
     s in ["α", "ἁ",  "ἀ",  "ᾳ"]
end


"""True if `c` is a Char representing the vowel alpha.

$(SIGNATURES)
"""
function alpha(c::Char)
    alpha(string(c))
end

