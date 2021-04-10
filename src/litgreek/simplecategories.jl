# functions for simple characters wtihout breathings.
# Used by Kanones parser.

"""Consonants in `LiteraryGreekOrthography`.

$(SIGNATURES)
"""
function consonants(ortho::LiteraryGreekOrthography)
    "βγδζθκλμνξπρστφχψς"
end




"""Simple vowels in `LiteraryGreekOrthography`.

$(SIGNATURES)

This does not include codepoints for vowels combined with accents.
It does include codepoints for vowels combined
with breathing, diaeresis or iota subscript.        
"""
function vowels(ortho::LiteraryGreekOrthography)
    nfkc("αἀἁᾳἐἑηἠἡῃιἱἰϊοὁὀυὑὐϋωὡὠῳ")
end
