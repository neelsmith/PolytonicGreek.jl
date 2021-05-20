"""Generic method of GreekOrthography's augment function.

$(SIGNATURES)

# Parameters

- `ortho` An instance of a `GreekOrthography`
- `s` An optional string to augment.
"""
function augment(ortho::T; s) where {T <: GreekOrthography}
    @warn "No syllabify function defined for orthography $(typeof(ortho))"
    nothing
end