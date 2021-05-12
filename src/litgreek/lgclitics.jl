
"""List proclitics in LiteraryGreekOrthography.

$(SIGNATURES)

Based on Smyth ¶ 179.
"""
function proclitics(ortho::LiteraryGreekOrthography)
    [
        "ὁ",
        "ἡ",
        "οἱ",
        "αἱ",
        "ἐν",
        "εἰς",
        "ἐς",
        "ἐξ",
        "ἐκ",
        "εἰ",
        "ὡς",
        "οὐ",
        "οὐκ",
        "οὐχ"
    ]
end



"""List enclitics in LiteraryGreekOrthography.

$(SIGNATURES)

Based on Smyth ¶ 181.
"""
function enclitics(ortho::LiteraryGreekOrthography)
    [
        "μου",
        "μοι",
        "με",
        "σου",
        "σοι",
        "σε",
        "οὑ",
        "οἱ",
        "ἑ",
        "σφισι",

        "τις",
        "τι",
        "του",
        "τινος",
        "τῳ",
        "τινι",
        "τινα",
        "τινες",
        "τινων",
        "τινας",

        "που",
        "ποθι",
        "πῃ",
        "ποι",
        "ποθεν",
        "ποτε",
        "πω",
        "πως",

        "γε",
        "τε",
        "τοι",
        "περ",

        # add dissylabic forms of eimi and fhmi
        
    ]
end
