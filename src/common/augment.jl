"""Generic method of function to augment a string.

$(SIGNATURES)

# Parameters

- `ortho` An instance of a `GreekOrthography`
"""
function augment(ortho::T, s::AbstractString) where {T <: GreekOrthography}
    @warn "No `augment`` function defined for orthography $(typeof(ortho))"
    nothing
end

"""Generic method of function to identify string for syllabic augment in initial position.

$(SIGNATURES)

# Parameters

- `ortho` An instance of a `GreekOrthography`
"""
function augment_initial(ortho::T) where {T <: GreekOrthography}
    @warn "No `augment_initial`` function defined for orthography $(typeof(ortho))"
    nothing
end


"""Generic method of function to identify string for syllabic augment when preceded by a prefix.

$(SIGNATURES)

# Parameters

- `ortho` An instance of a `GreekOrthography`
"""
function augment_medial(ortho::T) where {T <: GreekOrthography}
    @warn "No `augment_medial`` function defined for orthography $(typeof(ortho))"
    nothing
end
