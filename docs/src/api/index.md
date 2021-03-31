# API documentation


```@contents
Pages = ["apis.md"]
Depth = 3
```

## Accentuation


```@docs
rmaccents
accentword
```


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

```@docs
LiteraryGreekOrthography
literaryGreek
tokenizeLiteraryGreek
```

### Internals: orthography

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