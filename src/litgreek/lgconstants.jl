
# Consonants
const LG_CONSONANTS= "βγδζθκλμνξπρστφχψς"
const LG_NONLIQUIDS = "βγδζθκλξπστφχψς"
const LG_LIQUIDS = "μνρλ"

# Vowel classes:
# these are strings that can be used in a Regex
# class (in square brackets) to define a set of
# Characters
const LG_SIMPLEVOWELS =  "αεηιουω"
const LG_DIAERESES = Unicode.normalize("ϊϋ",:NFKC)
const LG_ROUGHVOWELS = Unicode.normalize("ἁἑἡἱὁὑὡ", :NFKC)
const LG_SMOOTHVOWELS = Unicode.normalize("ἀἐἠἰὀὐὠ", :NFKC)
const LG_IOTASUBS = Unicode.normalize("ᾳῃῳᾁᾑᾡᾀᾐᾠ", :NFKC)
const LG_VOWELS = "$(LG_SIMPLEVOWELS)$(LG_SMOOTHVOWELS)$(LG_ROUGHVOWELS)$(LG_DIAERESES)$(LG_IOTASUBS)"
const LG_SHORTVOWELS = Unicode.normalize("εοἑἐὁὀ", :NFKC)
const LG_POSSIBLESHORT = Unicode.normalize("αιἀἰἁἱϊ", :NFKC)
const LG_LONGVOWELS = Unicode.normalize("ηῃωῳᾳἡᾑὡᾡᾁἠᾐὠᾠᾀ", :NFKC)

# diphthongs:
# this is a Regex disjunction for diphthongs:
const LG_DIPHTHONGS = "αι|ει|οι|υι|αυ|ευ|ου|ηυ|ωυ|υἰ|αἰ|εἰ|οἰ|αὐ|εὐ|οὐ|ηὐ|ωὐ|υἰ|αἱ|εἱ|οἱ|αὑ|εὑ|οὑ|ηὑ|ωὑ|υἱ"  
