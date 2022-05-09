
"""Abstract type for orthographic systems implementing  functions specific to Greek
orthography, in addition to the requires of the Orthography.jl package's OrthographicSystem.
"""
abstract type GreekOrthography <: OrthographicSystem end
    

"""List proclitics in this orthography.

$(SIGNATURES)
"""
function proclitics(ortho::T) where {T <: GreekOrthography}
    @warn "Function proclitics not defined for orthography $(typeof(ortho))"
    nothing
end


"""List enclitics in this orthography.

$(SIGNATURES)
"""
function enclitics(ortho::T) where {T <: GreekOrthography}
    @warn "Function enclitics not defined for orthography $(typeof(ortho))"
    nothing
end


"""Concatenate `s1` and `s2` d, taking account of any phonological
modifications required by orthography `ortho`.

$(SIGNATURES)
"""
function strcat(s1::AbstractString,s2::AbstractString,ortho::T) where {T <: GreekOrthography}
    @warn "Function strcat not defined for orthography $(typeof(ortho))"
    nothing
end

"""Add reduplications to `s`, taking account of any phonological
modifications required by orthography `ortho`.

$(SIGNATURES)
"""
function reduplicate(s::AbstractString, ortho::T) where {T <: GreekOrthography}
    @warn "Function reduplicate not defined for orthography $(typeof(ortho))"
    nothing
end
  
