
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


function strcat(ortho::T, s1::AbstractString,slist...) where {T <: GreekOrthography}
    if isempty(slist)
        s1
    elseif length(slist) == 1
        strcat(s1,slist[1],ortho)
    else
        @info("s1 is ", s1)
        @info("slist[1] is ", slist[1])
        pair1 =  strcat(s1, slist[1],ortho)
        @info("pair 1", pair1)
        strcat(ortho, pair1, slist[2:end]...)
    end
end

"""Concatenate the pair of strings `s1` and `s2` d, taking account of any phonological
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
  
