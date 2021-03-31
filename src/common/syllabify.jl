
"""$(SIGNATURES)

Respect explicitly indicated morpheme boundaries.

# Example
```jldoctest
PolytonicGreek.splitmorphemeboundary("εἰσ#ῄα")
"εἰσ ῄα"
```
"""
function splitmorphemeboundary(s)
    replace(s, "#" => " ")
end


"""Mu+nu stay together.

ἀναμιμνησκόμενος breaks as "ἀναμι μνησκομενος"
"""
function splitmunu(s)
    replace(s, "μν" => " μν")
end