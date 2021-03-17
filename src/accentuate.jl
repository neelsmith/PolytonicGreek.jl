# Manipulate accents.

abstract type Accent end

struct Barytone <: Accent
    label
end

struct Oxytone <: Accent
    label
end

struct Paroxytone <: Accent
    label
end


struct Proaroxytone <: Accent
    label
end

struct Perispomenon <: Accent
    label
end

struct Properispomenon <: Accent
    label
end


function accentdict() 
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
        'ᾇ' => 'ᾁ'
    )
end

"""Remove all accent characters."""
function rmaccent(s)
    stripped = []
    dict = accentdict()
    for c in Unicode.normalize(s, :NFKC)
        if c in keys(dict)
            push!(stripped, dict[c])
        else
            push!(stripped,c)
        end
    end
    join(stripped,"")
end