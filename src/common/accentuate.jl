"""Strip vowel quantity marker from `s`.

$(SIGNATURES)
"""
function stripquant(s::AbstractString)
    replace(s, "_" => "")
end

"""
Accent final syllable of `wrd`.

$(SIGNATURES)

# Parameters

- `s` is a Greek string
- `accent` is `:ACUTE`,  or `:CIRCUMFLEX`
- `ortho` is an implementation of `GreekOrthography`
"""
function accentultima(wrd::AbstractString, accent::Symbol, ortho::T ) where {T <: GreekOrthography}
    @warn "No implementation of accentultima function for orthography $(typeof(ortho))"
    nothing
end

"""
Accent penultimate syllable of `wrd`.

$(SIGNATURES)

# Parameters

- `s` is a Greek string
- `accent` is `:ACUTE`,  or `:CIRCUMFLEX`
- `ortho` is an implementation of `GreekOrthography`
"""
function accentpenult(wrd::AbstractString, accent::Symbol, ortho::T) where {T <: GreekOrthography}
    @warn "No implementation of accentpenult function for orthography $(typeof(ortho))"
    nothing
end


"""
Accent word `s`.

$(SIGNATURES)

# Parameters

- `s` is a Greek string
- `placement` is `:RECESSIVE`,  or `:PENULT`
- `ortho` is an implementation of `GreekOrthography`
"""
function accentword(s, placement::Symbol, ortho::T) where {T <: GreekOrthography}
    @warn "No implementation of accentword function for orthography $(typeof(ortho))"
    nothing
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