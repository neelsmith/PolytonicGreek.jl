

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

"""Boolean function true if string `s` begins with a smooth breathing.
$(SIGNATURES)
"""
function smooth(s::AbstractString, ortho::T) where {T <: GreekOrthography}
end

"""Boolean function true if string `s` begins with a rough breathing.
$(SIGNATURES)
"""
function rough(s::AbstractString, ortho::T) where {T <: GreekOrthography}
end

function aspirate(cp::AbstractChar, ortho::T) where {T <: GreekOrthography}
end

function aspiratefinal(s::AbstractString, ortho::T) where {T <: GreekOrthography}
end