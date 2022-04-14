# Augment

## Adding augment to strings

The `augment` function adds appropriate syllabic or temporal augment to a string.  It does *not* accent the string: you can do that separately with the functions described on the previous page.

```jldoctest augment
using PolytonicGreek 
lg = literaryGreek()
augment(lg, s = "βαλε")

# output

"ἐβαλε"
```

```jldoctest augment
augment(lg; s = "αἱρει")

# output

"ᾑρει"
```


```jldoctest augment
 augment(lg; s = "ὑβριζε") 

# output

"ὑ_βριζε"
```



## Identifying augment patterns for an orthography

Two functions identify the syllabic string value for an orthography for augmenting simplex and compound verbs, `augment_initial`  and `augment_medial`, respectively.

```jldoctest augment
augment_initial(lg)

# output

"ἐ"
```




```jldoctest augment
augment_medial(lg)

# output

"ε"
```

You can always find appropriate values for temporal augment in a given orthography by using the `augment` function with a verb form's initial vowel or diphthong.

```jldoctest augment
augment(lg, s = "αἱ")

# output

"ᾑ"
```


```jldoctest augment
augment(lg, s = "ε")

# output

"η"
```