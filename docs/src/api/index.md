# API documentation

## String composition

```@docs
strcat
sortWords
```

## Phonology

```@docs
vocalic
consonantal
liquids
labials
dentals
palatals
stops
```

## Reduplication and augment

```@docs
augment
augment_initial
augment_medial
reduplicate
```
## Accentuation

```@docs
rmaccents
accentword
accented
proclitics
enclitics
rmbreathing
addbreathing
countaccents
accentpenult
accentultima
```

## Syllabification


```@docs
syllabify
```


##  Orthographic system


```@docs
LiteraryGreekOrthography
literaryGreek


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





### Internals

```@docs
PolytonicGreek.alphabetic
PolytonicGreek.punctuation
PolytonicGreek.isAlphabetic
PolytonicGreek.isPunctuation
PolytonicGreek.tokenforstring
PolytonicGreek.splitPunctuation
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
PolytonicGreek.accentantepenult
PolytonicGreek.ultima
PolytonicGreek.penult
PolytonicGreek.longsyllable
PolytonicGreek.shortsyllable
PolytonicGreek.includesdiphthong
PolytonicGreek.flipaccent
PolytonicGreek.vowelsonly
PolytonicGreek.tokenform
PolytonicGreek.stripenclitic
PolytonicGreek.normalizediaresis
PolytonicGreek.normalizeaccentcombos
```