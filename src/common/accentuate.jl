"""Strip vowel quantity marker from `s`.

$(SIGNATURES)
"""
function stripquant(s::AbstractString)
    replace(s, "_" => "")
end

"""
Remove all accent characters from `s`.

$(SIGNATURES)

# Parameters

- `s` is a Greek string
- `ortho` is an implementation of `GreekOrthography`
"""
function rmaccents(s::AbstractString, ortho::T) where {T <: GreekOrthography}
    @warn "No implementation of rmaccents function for orthography $(typeof(ortho))"
    nothing
end

"""Default to using literary Greek orthography for rmaccents.

$(SIGNATURES)
"""
function rmaccents(s::AbstractString)
    rmaccents(s, literaryGreek())
end

"""Count accents in `s`.

$(SIGNATURES)


# Parameters

- `s` is a Greek string
- `ortho` is an implementation of `GreekOrthography`
"""
function countaccents(s::AbstractString, ortho::T) where {T <: GreekOrthography}
    @warn "No implementation of countaccents function for orthography $(typeof(ortho))"
    nothing
end

"""Default to using literary Greek orthography for countaccents.

$(SIGNATURES)
"""
function countaccents(s::AbstractString)
    countaccents(s, literaryGreek())
end