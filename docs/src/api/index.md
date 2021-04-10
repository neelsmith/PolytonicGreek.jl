# API documentation


```@contents
Pages = ["index.md"]
Depth = 3
```

## Accentuation

### Exported functions

```@docs
rmaccents
accentword
```


### Internals

```@docs
PolytonicGreek.allaccents
PolytonicGreek.accentstripdict
PolytonicGreek.flipdict
PolytonicGreek.acutedict
PolytonicGreek.circumflexdict
PolytonicGreek.addacute
PolytonicGreek.addcircumflex
PolytonicGreek.accentsyllable
PolytonicGreek.accentultima
PolytonicGreek.accentpenult
PolytonicGreek.accentantepenult
PolytonicGreek.ultima
PolytonicGreek.penult
PolytonicGreek.longsyllable
PolytonicGreek.shortsyllable
PolytonicGreek.includesdiphthong
PolytonicGreek.flipaccent
PolytonicGreek.vowelsonly
PolytonicGreek.tokenform
PolytonicGreek.countaccents
PolytonicGreek.stripenclitic
PolytonicGreek.normalizediaresis
PolytonicGreek.normalizeaccentcombos
```

##  Orthography


### Exported functions and structure

```@docs
LiteraryGreekOrthography
literaryGreek
tokenizeLiteraryGreek
vowels
consonants
```

### Internals

```@docs
PolytonicGreek.alphabetic
PolytonicGreek.punctuation
PolytonicGreek.isAlphabetic
PolytonicGreek.isPunctuation
PolytonicGreek.sortWords
PolytonicGreek.tokenforstring
PolytonicGreek.splitPunctuation
```

## Syllabification

### Exported function

```@docs
syllabify
```


### Internals

Syllabification is implemented with a chain of functions applying regular expressions to an input string.  These internal functions would not normally be of any use or interest to anyone who simply wants to break a string in polytonic Greek into syllables.

```@docs
PolytonicGreek.splitmorphemeboundary
PolytonicGreek.splitmunu
PolytonicGreek.splitliqcons
PolytonicGreek.splitdiphthongvowel
PolytonicGreek.splitvoweldiphthong
```