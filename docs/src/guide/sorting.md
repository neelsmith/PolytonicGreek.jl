# Sorting strings


The `sortWords` function sorts Unicode Greek by the logic of the Greek alphabet, rather than by Unicode codepoint values, which scatter various combinations of accents, breathings, and other compounding elements on the same basic character across the codepoint table so that they might sort hundreds of characters apart.

Compare what happens when sorting words in the phrase *μῆνιν ἄειδε θεά* by Unicode value and by using PolytonicGreek's `sortWords` function.

```jldoctest loaded
wordlist = split("μῆνιν ἄειδε θεά")
unicodesort = sort(wordlist)
join(unicodesort, " ")

# output

"θεά μῆνιν ἄειδε"
```

```jldoctest loaded
using PolytonicGreek
rationalsort = PolytonicGreek.sortWords(wordlist)
join(rationalsort, " ")

# output

"ἄειδε θεά μῆνιν"
```

