
"""Identify code points representing simple vowels.

$(SIGNATURES)

This does not include code points representing vowels combined 
with accents. It does include any code points representing
vowels plus breathing or vowels with subscript.
"""
function vowels(ortho::T) where {T <: GreekOrthography}
    @warn "Function vowels not defined for orthography $(typeof(ortho))"
    nothing
end

"""Identify code points representing consonants.

$(SIGNATURES)
"""
function consonants(ortho::T) where {T <: GreekOrthography}
    @warn "Function consonants not defined for orthography $(typeof(ortho))"
    nothing
end

"""Identify code points representing liquid consonants.

$(SIGNATURES)
"""
function liquids(ortho::T) where {T <: GreekOrthography}
    @warn "Function liquids not defined for orthography $(typeof(ortho))"
    nothing
end

"""Identify code points representing labial consonants.

$(SIGNATURES)
"""
function labials(ortho::T) where {T <: GreekOrthography}
    @warn "Function labials not defined for orthography $(typeof(ortho))"
    nothing
end

"""Identify code points representing dental consonants.

$(SIGNATURES)
"""
function dentals(ortho::T) where {T <: GreekOrthography}
    @warn "Function dentals not defined for orthography $(typeof(ortho))"
    nothing
end

"""Identify code points representing palatal consonants.

$(SIGNATURES)
"""
function palatals(ortho::T) where {T <: GreekOrthography}
    @warn "Function palatals not defined for orthography $(typeof(ortho))"
    nothing
end


"""Identify code points representing stops.

$(SIGNATURES)
"""
function stops(ortho::T) where {T <: GreekOrthography}
    vcat(labials(ortho), dentals(ortho), palatals(ortho))
end


