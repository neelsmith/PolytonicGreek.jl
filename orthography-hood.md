## Under the hood

The package can enumerate all valid Unicode code points for alphabetic and punctuation characters.

```jldoctest loaded
puncts = PolytonicGreek.punctuation()

# output

".,;:"
```

```jldoctest loaded
PolytonicGreek.alphabetic() |> length

# output
267
```

It uses these to categorize tokens and to divide strings into  sequences of alphabetic and punctuation characters.

```jldoctest loaded
PolytonicGreek.isAlphabetic("μῆνιν")

# output

true
```

```jldoctest loaded
PolytonicGreek.isPunctuation(":")

# output

true
```


```jldoctest loaded
PolytonicGreek.splitPunctuation("ἄειδε,")

# output

2-element Array{AbstractString,1}:
 "ἄειδε"
 ","
```


### Functions supporting tokenization


The `tokenforstring` function returns a single `OrthographicToken`.


```jldoctest loaded
t = PolytonicGreek.tokenforstring("μῆνιν")
t.tokencategory

# output

Orthography.LexicalToken()
```

```jldoctest loaded
t.text

# output

"μῆνιν"
```


The `tokenizeLiteraryGreek` is the function assigned to the `tokenizer` member of `LiteraryGreekOrthography`s.  Using it by itself is identical to creating a `LiteraryGreekOrthography` and using its generic `tokenize` function, as illustrated above.

```jldoctest loaded
tokens = PolytonicGreek.tokenizeLiteraryGreek("μῆνιν ἄειδε,")
length(tokens)

# output

3
``` 

```jldoctest loaded
tokens[end].text

# output

","
```

```jldoctest loaded
tokens[end].tokencategory

# output
Orthography.PunctuationToken()
```
