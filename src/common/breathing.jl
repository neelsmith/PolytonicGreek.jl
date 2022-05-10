

"""Add a specified breathing to `s`.
$(SIGNATURES)
`breath` should be one of `:SMOOTH` or `:ROUGH`.
"""
function addbreathing(s::AbstractString, breath::Symbol, ortho::T) where {T <: GreekOrthography}
end


"""Remove any breathing from `s`.
$(SIGNATURES)
"""
function rmbreathing(s::AbstractString, ortho::T) where {T <: GreekOrthography}
end
