# Syllabification

## Exported function

```@docs
syllabify
```


## Internals

Syllabification is implemented with a chain of functions applying regular expressions to an input string.  These internal functions would not normally be of any use or interest to anyone who simply wants to break a string in polytonic Greek into syllables.

```@docs
PolytonicGreek.splitmorphemeboundary
PolytonicGreek.splitmunu
PolytonicGreek.splitliqcons
PolytonicGreek.splitdiphthongvowel
PolytonicGreek.splitvoweldiphthong
```