
"""Split string `s` into an Array of strings representing syllables.

$(SIGNATURES)

Default to using `LiteraryGreekOrthography`.
```

"""
function syllabify(s)
    syllabify(s, literaryGreek())
end


"""Respect explicitly indicated morpheme boundaries.

$(SIGNATURES)


# Example
```jldoctest
PolytonicGreek.splitmorphemeboundary("εἰσ#ῄα")
"εἰσ ῄα"
```
"""
function splitmorphemeboundary(s)
    replace(s, "#" => " ")
end
