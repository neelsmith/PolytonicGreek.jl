# Generic features of an orthographic system

The `GreekOrthography` abstract type is a subtype of `OrthographicSystem`.  Concrete implementations of `GreekOrthography` are therefore also implementations of an `OrthographicSystem`. In the following code blocks, you can see that  `LiteraryGreekOrthography` inherits from `OrthographicSystem` via `GreekOrthography`, and can be used like any other `OrthographicSystem` to assess the validity of characters and strings, and analyze strings of characters as sequences of classified tokens.



```@example loaded
using PolytonicGreek
lg = literaryGreek()
typeof(lg)
```

```@example loaded
typeof(lg) |> supertype
```

```@example loaded
typeof(lg) |> supertype |> supertype
```



## Assessing characters and strings
    
    
```@example loaded
using Orthography
omicron = "ο"
validcp(omicron, lg)
```

```@example loaded
latinO = "o"
validcp(latinO, lg)
```


```@example loaded
greek = "μῆνιν ἄειδε"
validstring(greek, lg)
```

```@example loaded
notgreek = "μῆνιν?"
validstring(notgreek, lg)
```


## Tokenizing strings
    
Subtypes of `Orthography.OrthographicSystem` include a `tokenizer` function that analyzes a string encoded in this orthographic system into an Array of `OrthographicToken`s, which are classified string values.  For example, the string *μῆνιν ἄειδε,* is analyzed as three tokens, two of type `LexicalToken`, and one of type `PunctuationToken`

```@example loaded
tokenized = tokenize("μῆνιν ἄειδε,", lg)
length(tokenized)
```

```@example loaded
tokenized[1].text
```

```@example loaded
tokenized[1].tokencategory
```


```@example loaded
tokenized[end].text
```


```@example loaded
tokenized[end].tokencategory
```
