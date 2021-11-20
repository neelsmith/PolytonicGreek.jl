
# The `GreekOrthography` abstraction

`GreekOrthography` is an abstract type, which in turn is a 
subtype of the [Orthography package](https://github.com/hcmid/Orthography.jl)'s `OrthographicSystem`.

Implementations of `GreekOrthography` can therefore:


1. use the functions specific to implementations of `GreekOrthography` to remove and add accents to words, to break words into syllables, and to sort words according to the logic of the Greek alphabet
2. use the generic functions of the `Orthography` package to assess the validity of characters and strings, and to tokenize a string into a series of explicitly classified tokens.

