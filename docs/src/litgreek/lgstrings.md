
# Features of a Greek orthography

`LiteraryGreekOrthography` implements the following functions from the `GreekOrthography` interface.


```@example lgstrings
using PolytonicGreek
lg = literaryGreek()
typeof(lg)
```


## Accentuation

Strip accents from a string according to a specified implementation of `GreekOrthography`.

```@example lgstrings
rmaccents("πολλά", lg)
```


You can add accents to an unaccented word by specifying the accent pattern as `:RECESSIVE`

```@example lgstrings
accentword("ἀνθρωποι", :RECESSIVE, lg) 
```
## Syllabification

```@example lgstrings
syllabify("ἄνθρωποι", lg) 
```

(See more extensive examples on the following page.)

## Sorting


```@example lgstrings
wordlist = split("μῆνιν ἄειδε θεά")
sortWords(wordlist, lg)
```