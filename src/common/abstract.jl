
"""Abstract type for orthographic systems implementing  functions specific to Greek
orthography, in addition to the requires of the Orthography.jl package's OrthographicSystem.
"""
abstract type GreekOrthography <: OrthographicSystem end
    

"""Identify code points representing simple vowels.

$(SIGNATURES)

This does not include code points representing vowels combined 
with accents. It does include any code points representing
vowels plus breathing or vowels with subscript.
"""
function vowels(ortho::GreekOrthography)
    @warn "Function vowels not defined for orthography $ortho"
    nothing
end


"""Identify code points representing consonants.

$(SIGNATURES)
"""
function consonants(ortho::GreekOrthography)
    @warn "Function consonants not defined for orthography $ortho"
    nothing
end