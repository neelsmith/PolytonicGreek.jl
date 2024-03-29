"""
Dictionary mapping Unicode codepoints with accents to
codepoint with accent stripped for `LiteraryGreekOrthography`.

$(SIGNATURES)

We can't just use Unicode.normalize with stripmark flag because
that strips breathings, iota subscripts, and diaereses as well.
"""
function accentstripdict(ortho::LiteraryGreekOrthography) 
    Dict(
       'ά'  => 'α',
       'ὰ' => 'α',
       'ᾶ' => 'α',
       'ᾴ' => 'ᾳ',
       'ᾲ' => 'ᾳ',
       'ᾷ' => 'ᾳ',
       'ἄ' => 'ἀ',
       'ἂ' => 'ἀ',
       'ἆ' => 'ἀ',
       'ᾄ' => 'ᾀ',
       'ᾂ' => 'ᾀ',
       'ᾆ' => 'ᾀ',
       'ἅ' => 'ἁ',
       'ἃ' => 'ἁ',
       'ἇ' => 'ἁ',
       'ᾅ' => 'ᾁ',
       'ᾃ' => 'ᾁ',
       'ᾇ' => 'ᾁ',
       #= eta goes like alpha =#
       'ή'  => 'η',
       'ὴ' => 'η',
       'ῆ' => 'η',
       'ῄ' => 'ῃ',
       'ῂ' => 'ῃ',
       'ῇ' => 'ῃ',
       'ἤ' => 'ἠ',
       'ἢ' => 'ἠ',
       'ἦ' => 'ἠ',
       'ᾔ' => 'ᾐ',
       'ᾒ' => 'ᾐ',
       'ᾖ' => 'ᾐ',
       'ἥ' => 'ἡ',
       'ἣ' => 'ἡ',
       'ἧ' => 'ἡ',
       'ᾕ' => 'ᾑ',
       'ᾓ' => 'ᾑ',
       'ᾗ' => 'ᾑ',
       #= omega goes like eta and alpha =#
       'ώ'  => 'ω',
       'ὼ' => 'ω',
       'ῶ' => 'ω',
       'ῴ' => 'ῳ',
       'ῲ' => 'ῳ',
       'ῷ' => 'ῳ',
       'ὤ' => 'ὠ',
       'ὢ' => 'ὠ',
       'ὦ' => 'ὠ',
       'ᾤ' => 'ᾠ',
       'ᾢ' => 'ᾠ',
       'ᾦ' => 'ᾠ',
       'ὥ' => 'ὡ',
       'ὣ' => 'ὡ',
       'ὧ' => 'ὡ',
       'ᾥ' => 'ᾡ',
       'ᾓ' => 'ᾡ',
       'ᾗ' => 'ᾡ',
       #= iota is different =#
       'ί' => 'ι',
       'ὶ' => 'ι',
       'ῖ' => 'ι',
       'ἴ' => 'ἰ',
       'ἲ' => 'ἰ',
       'ἶ' => 'ἱ',
       'ἵ' => 'ἱ',
       'ἳ' => 'ἱ',
       'ἷ' => 'ἱ',
       'ΐ' => 'ϊ',
       'ῒ' => 'ϊ',
       'ῗ' => 'ϊ',
       #= upsilon goes like iota =#
       'ύ' => 'υ',
       'ὺ' => 'υ',
       'ῦ' => 'υ',
       'ὔ' => 'ὐ',
       'ὒ' => 'ὐ',
       'ὖ' => 'ὐ',
       'ὕ' => 'ὑ',
       'ὓ' => 'ὑ',
       'ὗ' => 'ὑ',
       'ΰ' => 'ϋ',
       'ῢ' => 'ϋ',
       'ῧ' => 'ϋ',
       'έ' => 'ε',
       'ὲ' => 'ε',
       'ἔ' => 'ἐ',
       'ἒ' => 'ἐ',
       'ἕ' => 'ἐ',
       'ἓ' => 'ἑ',
       'ό' => 'ο',
       'ὸ' => 'ο',
       'ὄ' => 'ὀ',
       'ὂ' => 'ὀ',
       'ὅ' => 'ὁ',
       'ὃ' => 'ὁ'
   )
end


"""Dictionary of circumflexes for `LiteraryGreekOrthography`.

$(SIGNATURES)
"""
function circumflexdict(ortho::LiteraryGreekOrthography)
    Dict(
        [
            "α" => "ᾶ",
            "ι" => "ῖ",
            "υ" => "ῦ",
            "η" => "ῆ",
            "ω" => "ῶ",
    
            "ἀ" => "ἆ",
            "ἰ" => "ἶ",
            "ὐ" => "ὖ",
            "ἠ" => "ἦ",
            "ὠ" => "ὦ",
    
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
            "ᾐ" => "ᾖ",
            "ᾠ" => "ᾦ",
    
            "ᾁ" => "ᾇ",
            "ᾑ" => "ᾗ",
            "ᾡ" => "ᾧ", 
    
            # diaereses
            "ϊ" => "ῗ",
            "ϋ" => "ῧ",
    
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
    
        ]
    )
end

"""Dictionary of acutes for `LiteraryGreekOrthography`.

$(SIGNATURES)
"""
function acutedict(ortho::LiteraryGreekOrthography)
    Dict(
        [
            "α" => "ά",
            "ε" => "έ",
            "ι" => "ί",
            "ο" => "ό",
            "υ" => "ύ",
            "η" => "ή",
            "ω" => "ώ",
    
            "ἀ" => "ἄ",
            "ἐ" => "ἔ",
            "ἰ" => "ἴ",
            "ὀ" => "ὄ",
            "ὐ" => "ὔ",
            "ἠ" => "ἤ",
            "ὠ" => "ὤ",
    
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
            "ϊ" => "ΐ",
            "ϋ" => "ΰ",
    
            # diphthongs
            "αι" => "αί",
            "ει" => "εί",
            "οι" => "οί",
            "υι" => "υί",
            "αυ" => "αύ",
            "ευ" => "εύ",
            "ου" => "ού",
            "ηυ" => "ηύ",
            "ωυ" => "ωύ",
            "υι" => "υί",
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
        ]
    )
end


"""Dictionary of barytone to oxytone conversions for `LiteraryGreekOrthography`.

$(SIGNATURES)
"""
function flipdict(ortho::LiteraryGreekOrthography)
    Dict(
        [
            "ὰ" => "ά" ,
            "ὲ" => "έ" ,
            "ὶ" => "ί" ,
            "ὸ" => "ό" ,
            "ὺ" => "ύ" ,
            "ὴ" => "ή" ,
            "ὼ" => "ώ" ,
            
            "ἂ" => "ἄ" ,
            "ἒ" => "ἔ" ,
            "ἲ" => "ἴ" ,
            "ὂ" => "ὄ" ,
            "ὒ" => "ὔ" ,
            "ἢ" => "ἤ" ,
            "ὢ" => "ὤ" ,
            
            "ἃ" => "ἅ" ,
            "ἓ" => "ἕ" ,
            "ἳ" => "ἵ" ,
            "ὃ" => "ὅ" ,
            "ὓ" => "ὕ" ,
            "ἣ" => "ἥ" ,
            "ὣ" => "ὥ" ,
            
            # iota subs
            "ᾲ" => "ᾴ" ,
            "ῂ" => "ῄ" ,
            "ῲ" => "ῴ" ,
            
            "ᾂ" => "ᾄ" ,
            "ᾒ" => "ᾔ" ,
            "ᾢ" => "ᾤ" ,
            
            "ᾃ" => "ᾅ" ,
            "ᾓ" => "ᾕ" ,
            "ᾣ" => "ᾥ" ,
            
            # diaereses
            "ῒ" => "ΐ" ,
            "ῢ" => "ΰ" ,
        ]
    )
end


"""Mapping of diphthong strings that change when augmented to their
augmented value.
$(SIGNATURES)
"""
function lgdiphaugments()
    Dict(
        nfkc("εἰ") => nfkc("ᾐ"),
        nfkc("εἱ") => nfkc("ᾑ"),
        "ει" => nfkc("ῃ"),

        nfkc("οἰ") => nfkc("ᾠ"),
        nfkc("οἱ") => nfkc("ᾡ"),
        "οι" => nfkc("ῳ"),

        nfkc("αἰ") => nfkc("ᾐ"),
        nfkc("αἱ") => nfkc("ᾑ"),
        "αι" => nfkc("ῃ"),

        nfkc("αὐ") => nfkc("ηὐ"),
        nfkc("αὑ") => nfkc("ηὑ"),
        "αυ" => "ηυ",

        nfkc("εὐ") => nfkc("ηὐ"),
        nfkc("εὑ") => nfkc("ηὑ"),
        "ευ" => "ηυ"
    )
end



"""Mapping of strings for vowels that change when augmented to their
augmented value.
$(SIGNATURES)
"""
function lgsimpleaugments()
    Dict(
        nfkc("ἀ") => nfkc("ἠ"),
        nfkc("ἁ") => nfkc("ἡ"),
        nfkc("ᾀ") => nfkc("ᾐ"),
        nfkc("ᾁ") => nfkc("ᾑ"),
        "α" => "η", 

        nfkc("ἐ") => nfkc("ἠ"),
        nfkc("ἑ") => nfkc("ἡ"),
        "ε" => "η",
     
        nfkc("ὀ") => nfkc("ὠ"),
        nfkc("ὁ") => nfkc("ὡ"),
        "ο" => "ω",

        nfkc("ἰ") => nfkc("ἰ_"),
        nfkc("ἱ") => nfkc("ἱ_"),
        "ι" => "ι_",


        nfkc("ὐ") => nfkc("ὐ_"),
        nfkc("ὑ") => nfkc("ὑ_"),
        "υ" => "υ_",
    )
end


"""List all code points including an accent in `LiteraryGreekOrthography`.

$(SIGNATURES)
"""
function allaccents(ortho::LiteraryGreekOrthography)
    acutes = acutedict(ortho::LiteraryGreekOrthography) |> values |> collect
    circumflexes = circumflexdict(ortho::LiteraryGreekOrthography) |> values |> collect
    graves = flipdict(ortho::LiteraryGreekOrthography) |> values |> collect
    vcat(acutes, circumflexes, graves)
end