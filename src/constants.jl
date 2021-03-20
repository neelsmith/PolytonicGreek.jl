
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
const VOWELS = "$(SIMPLEVOWELS)$(SMOOTHVOWELS)$(ROUGHVOWELS)$(DIAERESES)$(IOTASUBS)"
const SHORTVOWELS = Unicode.normalize("εοἑἐὁὀ", :NFKC)
const POSSIBLESHORT = Unicode.normalize("αιἀἰἁἱ", :NFKC)
const LONGVOWELS = Unicode.normalize("ηῃωῳᾳἡᾑὡᾡᾁἠᾐὠᾠᾀ", :NFKC)

# diphthongs:
# this is a Regex disjunction for diphthongs:
const DIPHTHONGS = "αι|ει|οι|αυ|ευ|ου|ηυ|ωυ|υἰ|αἰ|εἰ|οἰ|αὐ|εὐ|οὐ|ηὐ|ωὐ|υἰ|αἱ|εἱ|οἱ|αὑ|εὑ|οὑ|ηὑ|ωὑ|υἱ"  
