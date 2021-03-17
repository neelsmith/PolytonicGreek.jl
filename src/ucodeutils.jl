using Unicode


"""Collect a normalized set of all codepoints
with accent.
"""
function normalizeaccentcombos()
    combos = [
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
  
    ]
    map(s -> Unicode.normalize(s, :NFKC), combos)
end