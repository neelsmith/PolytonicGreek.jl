"""Generic method of GreekOrthography's syllabify function.

$(SIGNATURES)    
"""
function syllabify(s, ortho::T) where {T <: GreekOrthography}
    @warn "No syllabify function defined for orthography $(typeof(ortho))"
    nothing
end

"""Allow syllabification defaulting to LiteraryGreekOrthography.

$(SIGNATURES)
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
