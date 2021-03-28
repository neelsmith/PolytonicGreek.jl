```@meta
CurrentModule = PolytonicGreek
```

# Accentuation



Overview:  two exported functions allows you to remove accents from a string, or add accent to a "word" (a single lexical token).  Words may be accented either with recessive accent, or with persistent accent in the penult, indicated with a second parameter which should be either the symbol `:RECESSIVE` or `:PENULT`.  

!!! note
    Words cannot be accented on the ultima based on orthography alone; that requires further knowledge of the morphological form of the word.


```jldoctest accented
using PolytonicGreek 
rmaccents("πολλά")

# output

"πολλα"
```

```jldoctest accented
accentword("ἀνθρωπος", :RECESSIVE)

# output

"ἄνθρωπος"
```


