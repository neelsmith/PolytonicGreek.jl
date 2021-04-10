# functions for simple characters wtihout breathings.
# Used by Kanones parser.

"""Consonants in `LiteraryGreekOrthography`.

$(SIGNATURES)
"""
function lgconsonants()
    "βγδζθκλμνξπρστφχψς"
end




"""Simple vowels in `LiteraryGreekOrthography`.

$(SIGNATURES)

This does not include codepoints for vowels combined with accents.
It does include codepoints for vowels combined
with breathing, diaeresis or iota subscript.        
"""
function lgvowels()
    nfkc("αἀἁᾳἐἑηἠἡῃιἱἰϊοὁὀυὑὐϋωὡὠῳ")
end
