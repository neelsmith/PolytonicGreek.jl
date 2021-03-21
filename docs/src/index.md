# PolytonicGreek.jl Documentation
```@meta
CurrentModule = PolytonicGreek
```
```@contents
```
## Types
```@docs
LiteraryGreekOrthography
```

## Functions

### Implementing the MID orthography interface

```@docs
literaryGreek()
alphabetic()
punctuation()
isAlphabetic(s::AbstractString)
isPunctuation(s::AbstractString)
tokenforstring(s::AbstractString)
tokenizeLiteraryGreek(s::AbstractString)
```

### Working with accentuation and syllabification of literary Greek

```@docs
syllabify(s::AbstractString)
accentword(wrd::AbstractString, placement::Symbol)
accentsyllable(syll::AbstractString, accent::Symbol)
rmaccents(s::AbstractString)
addacute(s::AbstractString)
addcircumflex(s::AbstractString)

```



## Index
```@index
```
