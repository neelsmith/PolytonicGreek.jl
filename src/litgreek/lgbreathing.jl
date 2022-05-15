


"""Add the specified breathing to `s`.
$(SIGNATURES)
`breath` should be one of `:SMOOTH` or `:ROUGH`.
"""
function addbreathing(s::AbstractString, breath::Symbol, ortho::LiteraryGreekOrthography)
    breathy = ""
    if breath == :SMOOTH
        diphdict = lgsmoothdiphdict()
        for k in keys(diphdict)
            if startswith(s, k)
                breathy = replace(s, k => diphdict[k])
            end
        end
        if isempty(breathy)
            dict = lgsmoothdict()
            breathy = replace(s, s[1] => dict[s[1]])
        end


    elseif breath == :ROUGH
        diphdict = lgroughdiphdict()
        for k in keys(diphdict)
            if startswith(s, k)
                breathy = replace(s, k => diphdict[k])
            end
        end
        if isempty(breathy)
            dict = lgroughdict()
            breathy = replace(s, s[1] => dict[s[1]])
        end

    else
        throw(DomainError("addbreathing: value of `breath` should be :SMOOTH or :ROUGH"))
    end
end

"""Remove any breathing from `s`.
$(SIGNATURES)
"""
function rmbreathing(s::AbstractString, ortho::LiteraryGreekOrthography)
    dict = lgbreathstripdict()
    breathings = keys(dict)
    
    stripped = s
    for b in breathings
        if startswith(s, b)
            stripped = replace(s, b => dict[b])
        end
    end
    stripped
end


"""True is `s` has a rough breathing on the 
first syllable.
$(SIGNATURES)
"""
function lginitialrough(s::AbstractString)
    @info("INitial rough: ", s[1])
    if string(s[1]) in values(lgroughdict())
        true
    
    else
        rough = false
        for d in values(lgroughdiphdict())
            if startswith(s, d)
                rough = true
            end
        end
        rough
    end
end


"""True is `s` has a smooth breathing on the 
first syllable.
$(SIGNATURES)
"""
function lginitialsmooth(s::AbstractString)
    if string(s[1]) in values(lgsmoothdict())
        true
    
    else
        smooth = false
        for d in values(lgsmoothdiphdict())
            if startswith(s, d)
                smooth = true
            end
        end
        smooth
    end
end

"""Map diphthongs to code points for diphthong + rough breathing.
$(SIGNATURES)
"""
function lgroughdiphdict()
    Dict(
         "αι" => nfkc("αἱ"),
         "ει" => nfkc("εἱ"),
         "οι" => nfkc("οἱ"),
         "υι" => nfkc("υἱ"),
         "αυ" => nfkc("αὑ"),
         "ευ" => nfkc("εὑ"),
         "ου" => nfkc("οὑ"),
         "ηυ" => nfkc("ηὑ"),
         "ωυ" => nfkc("ωὑ"),


         nfkc("αῖ")  => nfkc("αἷ"),
         nfkc("εῖ")  => nfkc("εἷ"),
         nfkc("οῖ")  => nfkc("οἷ"),
         nfkc("υῖ")  => nfkc("υἷ"),
         nfkc("αῦ")  => nfkc("αὗ"),
         nfkc("εῦ")  => nfkc("εὗ"),
         nfkc("οῦ")  => nfkc("οὗ"),
         nfkc("ηῦ")  => nfkc("ηὗ"),
         nfkc("ωῦ")  => nfkc("ωὗ"),

         nfkc("αί")  => nfkc("αἵ"),
         nfkc("εί")  => nfkc("εἵ"),
         nfkc("οί")  => nfkc("οἵ"),
         nfkc("υί")  => nfkc("υἵ"),
         nfkc("αύ")  => nfkc("αὕ"),
         nfkc("εύ") => nfkc("εὕ"),
         nfkc("ού")  => nfkc("οὕ"),
         nfkc("ηύ")  => nfkc("ηὕ"),
         nfkc("ωύ")  => nfkc("ωὕ"),
    )
end



"""Map vowels to code points for vowel + rough breathing.
$(SIGNATURES)
"""
function lgroughdict()
    Dict(
    
         "α" => nfkc("ἁ"),
         "ε" => nfkc("ἑ"),
         "ι" => nfkc("ἰ"),
         "ο" => nfkc("ὁ"),
         "υ" => nfkc("ὑ"),
         "η" => nfkc("ἡ"),
         "ω" => nfkc("ὡ"),
         nfkc("ᾳ") => nfkc("ᾁ"),
         nfkc("ῃ") => nfkc("ᾑ"),
         nfkc("ῳ") => nfkc("ᾡ"),


         nfkc("ά") => nfkc("ἅ"),
         nfkc("έ") => nfkc("ἕ"),
         nfkc("ί") => nfkc("ἵ"),
         nfkc("ό") => nfkc("ὅ"),
         nfkc("ύ") => nfkc("ὕ"),
         nfkc("ή") => nfkc("ἥ"),
         nfkc("ώ") => nfkc("ὥ"),
         nfkc("ᾴ") => nfkc("ᾅ"),
         nfkc("ῄ") => nfkc("ᾕ"),
         nfkc("ῴ") => nfkc("ᾥ"),


         nfkc("ᾶ") => nfkc("ἇ"),
         nfkc("ῖ") => nfkc("ἷ"),
         nfkc("ῦ") => nfkc("ὗ"),
         nfkc("ῆ") => nfkc("ἧ"),
         nfkc("ῶ") => nfkc("ὧ"),
         nfkc("ᾷ") => nfkc("ᾇ"),
         nfkc("ῇ") => nfkc("ᾗ"),
         nfkc("ῷ") => nfkc("ᾧ"),
    )
end


"""Map diphthongs to code points for diphthong + smooth breathing.
$(SIGNATURES)
"""
function lgsmoothdiphdict()
    Dict(
        
         "αι" => nfkc("αἰ"),
         "ει" => nfkc("εἰ"),
         "οι" => nfkc("οἰ"),
         "υι" => nfkc("υἰ"),
         "αυ" => nfkc("αὐ"),
         "ευ" => nfkc("εὐ"),
         "ου" => nfkc("οὐ"),
         "ηυ" => nfkc("ηὐ"),
         "ωυ" => nfkc("ωὐ"),

         nfkc("αῖ")  => nfkc("αἶ"),
         nfkc("εῖ")  => nfkc("εἶ"),
         nfkc("οῖ")  => nfkc("οἶ"),
         nfkc("υῖ")  => nfkc("υἶ"),
         nfkc("αῦ")  => nfkc("αὖ"),
         nfkc("εῦ")  => nfkc("εὖ"),
         nfkc("οῦ")  => nfkc("οὖ"),
         nfkc("ηῦ")  => nfkc("ηὖ"),
         nfkc("ωῦ")  => nfkc("ωὖ"),

         nfkc("αί")  => nfkc("αἴ"),
         nfkc("εί")  => nfkc("εἴ"),
         nfkc("οί")  => nfkc("οἴ"),
         nfkc("υί")  => nfkc("υἴ"),
         nfkc("αύ")  => nfkc("αὔ"),
         nfkc("εύ") => nfkc("εὔ"),
         nfkc("ού")  => nfkc("οὔ"),
         nfkc("ηύ")  => nfkc("ηὔ"),
         nfkc("ω")  => nfkc("ωὔ")
    )
end

"""Map vowels to code points for vowel + smooth breathing.
$(SIGNATURES)
"""
function lgsmoothdict()
    Dict(
         "α" => nfkc("ἀ"),
         "ε" => nfkc("ἐ"),
         "ι" => nfkc("ἰ"),
         "ο" => nfkc("ὀ"),
         "υ" => nfkc("ὐ"),
         "η" => nfkc("ἠ"),
         "ω" => nfkc("ὠ"),
         nfkc("ᾳ") => nfkc("ᾀ"),
         nfkc("ῃ") => nfkc("ᾐ"),
         nfkc("ῳ") => nfkc("ᾠ"),
         
         nfkc("ά") => nfkc("ἄ"),
         nfkc("έ") => nfkc("ἔ"),
         nfkc("ί") => nfkc("ἴ"),
         nfkc("ό") => nfkc("ὄ"),
         nfkc("ύ") => nfkc("ὔ"),
         nfkc("ή") => nfkc("ἤ"),
         nfkc("ώ") => nfkc("ὤ"),
         nfkc("ᾴ") => nfkc("ᾄ"),
         nfkc("ῄ") => nfkc("ᾔ"),
         nfkc("ῴ") => nfkc("ᾤ"),

         nfkc("ᾶ") => nfkc("ἆ"),
         nfkc("ῖ") => nfkc("ἶ"),
         nfkc("ῦ") => nfkc("ὖ"),
         nfkc("ῆ") => nfkc("ἦ"),
         nfkc("ῶ") => nfkc("ὦ"),
         nfkc("ᾷ") => nfkc("ᾆ"),
         nfkc("ῇ") => nfkc("ᾖ"),
         nfkc("ῷ") => nfkc("ᾦ"),
    )
end


"""Replace character plus breathing with bare character.
$(SIGNATURES)
"""
function lgbreathstripdict()
    Dict(
        nfkc("ἀ") => "α",
        nfkc("ἐ") => "ε",
        nfkc("ἰ") => "ι",
        nfkc("ὀ") => "ο",
        nfkc("ὐ") => "υ",
        nfkc("ἠ") => "η",
        nfkc("ὠ") => "ω",
        nfkc("ᾀ") => nfkc("ᾳ"),
        nfkc("ᾐ") => nfkc("ῃ"),
        nfkc("ᾠ") => nfkc("ῳ"),
 

        nfkc("ἁ") => "α",
        nfkc("ἑ") => "ε",
        nfkc("ἰ") => "ι",
        nfkc("ὁ") => "ο",
        nfkc("ὑ") => "υ",
        nfkc("ἡ") => "η",
        nfkc("ὡ") => "ω",
        nfkc("ᾁ") => nfkc("ᾳ"),
        nfkc("ᾑ") => nfkc("ῃ"),
        nfkc("ᾡ") => nfkc("ῳ"),


        nfkc("αἰ") => "αι",
        nfkc("εἰ") => "ει",
        nfkc("οἰ") => "οι",
        nfkc("υἰ") => "υι",
        nfkc("αὐ") => "αυ",
        nfkc("εὐ") => "ευ",
        nfkc("οὐ") => "ου",
        nfkc("ηὐ") => "ηυ",
        nfkc("ωὐ") => "ωυ",

        nfkc("αἱ") => "αι",
        nfkc("εἱ") => "ει",
        nfkc("οἱ") => "οι",
        nfkc("υἱ") => "υι",
        nfkc("αὑ") => "αυ",
        nfkc("εὑ") => "ευ",
        nfkc("οὑ") => "ου",
        nfkc("ηὑ") => "ηυ",
        nfkc("ωὑ") => "ωυ",



        nfkc("ἄ") => nfkc("ά"),
        nfkc("ἔ") => nfkc("έ"),
        nfkc("ἴ") => nfkc("ί"),
        nfkc("ὄ") => nfkc("ό"),
        nfkc("ὔ") => nfkc("ύ"),
        nfkc("ἤ") => nfkc("ή"),
        nfkc("ὤ") => nfkc("ώ"),
        nfkc("ᾄ") => nfkc("ᾴ"),
        nfkc("ᾔ") => nfkc("ῄ"),
        nfkc("ᾤ") => nfkc("ῴ"),

        nfkc("ἆ") => nfkc("ᾶ"),
        nfkc("ἶ") => nfkc("ῖ"),
        nfkc("ὖ") => nfkc("ῦ"),
        nfkc("ἦ") => nfkc("ῆ"),
        nfkc("ὦ") => nfkc("ῶ"),
        nfkc("ᾆ") => nfkc("ᾷ"),
        nfkc("ᾖ") => nfkc("ῇ"),
        nfkc("ᾦ") => nfkc("ῷ"),

        nfkc("αἷ") => nfkc("αῖ"),
        nfkc("εἷ") => nfkc("εῖ"),
        nfkc("οἷ") => nfkc("οῖ"),
        nfkc("υἷ") => nfkc("υῖ"),
        nfkc("αὗ") => nfkc("αῦ"),
        nfkc("εὗ") => nfkc("εῦ"),
        nfkc("οὗ") => nfkc("οῦ"),
        nfkc("ηὗ") => nfkc("ηῦ"),
        nfkc("ωὗ") => nfkc("ωῦ"),

        nfkc("αἵ") => nfkc("αί"),
        nfkc("εἵ") => nfkc("εί"),
        nfkc("οἵ") => nfkc("οί"),
        nfkc("υἵ") => nfkc("υί"),
        nfkc("αὕ") => nfkc("αύ"),
        nfkc("εὕ") => nfkc("εύ"),
        nfkc("οὕ") => nfkc("ού"),
        nfkc("ηὕ") => nfkc("ηύ"),
        nfkc("ωὕ") => nfkc("ωύ"),

        nfkc("αἶ") => nfkc("αῖ"),
        nfkc("εἶ") => nfkc("εῖ"),
        nfkc("οἶ") => nfkc("οῖ"),
        nfkc("υἶ") => nfkc("υῖ"),
        nfkc("αὖ") => nfkc("αῦ"),
        nfkc("εὖ") => nfkc("εῦ"),
        nfkc("οὖ") => nfkc("οῦ"),
        nfkc("ηὖ") => nfkc("ηῦ"),
        nfkc("ωὖ") => nfkc("ωῦ"),

        nfkc("αἴ") => nfkc("αί"),
        nfkc("εἴ") => nfkc("εί"),
        nfkc("οἴ") => nfkc("οί"),
        nfkc("υἴ") => nfkc("υί"),
        nfkc("αὔ") => nfkc("αύ"),
        nfkc("εὔ") => nfkc("εύ"),
        nfkc("οὔ") => nfkc("ού"),
        nfkc("ηὔ") => nfkc("ηύ"),
        nfkc("ωὔ") => nfkc("ω")
    )
end