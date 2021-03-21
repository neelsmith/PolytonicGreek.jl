
function acutemappings()
    lines = """
        "α" => "ά",
        "ε" => "έ",
        "ι" => "ί",
        "ο" => "ό",
        "υ" => "ύ",
        "η" => "ή",
        "ω" => "ώ",

        "ἀ" => "ἄ",
        "ἐ" => "ἔ",
        "ἰ" => "ἴ",
        "ὀ" => "ὄ",
        "ὐ" => "ὔ",
        "ἠ" => "ἤ",
        "ὤ" => "ὤ",

        "ἁ" => "ἅ",
        "ἑ" => "ἕ",
        "ἱ" => "ἵ",
        "ὁ" => "ὅ",
        "ὑ" => "ὕ",
        "ἡ" => "ἥ",
        "ὡ" => "ὥ", 

        # iota subs
        "ᾳ" => "ᾴ",
        "ῃ" => "ῄ",
        "ῳ" => "ῴ",

        "ᾀ" => "ᾄ",
        "ᾐ" => "ᾔ",
        "ᾠ" => "ᾤ",

        "ᾁ" => "ᾅ",
        "ᾑ" => "ᾕ",
        "ᾡ" => "ᾥ", 

        # diaereses
        "ϊ" => "ΐ",
        "ϋ" => "ΰ",

        # diphthongs
        "αι" => "αί",
        "ει" => "εί",
        "οι" => "οί",
        "υι" => "υί",
        "αυ" => "αύ",
        "ευ" => "εύ",
        "ου" => "ού",
        "ηυ" => "ηύ",
        "ωυ" => "ωύ",
        "υι" => "υί",
        "αἰ" => "αἴ",
        "εἰ" => "εἴ",
        "οἰ" => "οἴ",
        "αὐ" => "αὔ",
        "εὐ" => "εὔ",
        "οὐ" => "οὔ",
        "ηὐ" => "ηὔ",
        "ωὐ" => "ωὔ",
        "υἰ" => "υἴ",
        "αἱ" => "αἵ",
        "εἱ" => "εἵ",
        "οἱ" => "οἵ",
        "αὑ" => "αὕ",
        "εὑ" => "εὕ",
        "οὑ" => "οὕ",
        "ηὑ" => "ηὕ",
        "ωὑ" => "ωὕ",
        "υἱ" => "υἵ"
"""


    Unicode.normalize(lines, :NFKC)
end




function circmappings()
    lines = """
        "α" => "ᾶ",
        "ι" => "ῖ",
        "υ" => "ῦ",
        "η" => "ῆ",
        "ω" => "ῶ",

        "ἀ" => "ἆ",
        "ἰ" => "ἶ",
        "ὐ" => "ὖ",
        "ἠ" => "ἦ",
        "ὤ" => "ὦ",

        "ἁ" => "ἇ",
        "ἱ" => "ἷ",
        "ὑ" => "ὗ",
        "ἡ" => "ἧ",
        "ὡ" => "ὧ", 

        # iota subs
        "ᾳ" => "ᾷ",
        "ῃ" => "ῇ",
        "ῳ" => "ῷ",

        "ᾀ" => "ᾆ",
        "ᾐ" => ᾖ,
        "ᾠ" => "ᾦ",

        "ᾁ" => "ᾇ",
        "ᾑ" => "ᾗ",
        "ᾡ" => "ᾧ", 

        # diaereses
        "ϊ" => "ῗ",
        "ϋ" => "ῧ"

        # diphthongs
        "αι" => "αῖ",
        "ει" => "εῖ",
        "οι" => "οῖ",
        "υι" => "υῖ",
        "αυ" => "αῦ",
        "ευ" => "εῦ",
        "ου" => "οῦ",
        "ηυ" => "ηῦ",
        "ωυ" => "ωῦ",
        "υι" => "υῖ",
        "αἰ" => "αἶ",
        "εἰ" => "εἶ",
        "οἰ" => "οἶ",
        "αὐ" => "αὖ",
        "εὐ" => "εὖ",
        "οὐ" => "οὖ",
        "ηὐ" => "ηὖ",
        "ωὐ" => "ωὖ",
        "υἰ" => "υἶ",
        "αἱ" => "αἷ",
        "εἱ" => "εἷ",
        "οἱ" => "οἷ",
        "αὑ" => "αὗ",
        "εὑ" => "εὗ",
        "οὑ" => "οὗ",
        "ηὑ" => "ηὗ",
        "ωὑ" => "ωὗ",
        "υἱ" => "υἷ"
"""


    Unicode.normalize(lines, :NFKC)
end


function dipmappings()
    dips = split("αι|ει|οι|υι|αυ|ευ|ου|ηυ|ωυ|υἰ|αἰ|εἰ|οἰ|αὐ|εὐ|οὐ|ηὐ|ωὐ|υἰ|αἱ|εἱ|οἱ|αὑ|εὑ|οὑ|ηὑ|ωὑ|υἱ", "|")
    lines = []
    for d in dips
        push!(lines, string("\"", d, "\" => \"\","))
    end
    lines
end
