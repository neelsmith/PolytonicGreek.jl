"""Concatenate `s1` and `s2` d, taking account of necessary phonological modifications.

$(SIGNATURES)
"""
function strcat(s1::AbstractString,s2::AbstractString,ortho::LiteraryGreekOrthography)
    part2 = rmbreathing(s2, ortho)
    s1 = elide(s1, part2, ortho)

    @debug("After elision, s1 is ", s1)
    if occursin(r"[πβφ]$", s1)
        lg_appendtolabial(s1,part2) |> nfkc

    elseif occursin(r"[τδθ]$", s1)
        lg_appendtodental(s1,part2) |> nfkc

    elseif occursin(r"[κγχ]$", s1)
        lg_appendtopalatal(s1,part2) |> nfkc

    elseif endswith(s1, "ν")
        @debug("Append to nu")
        lg_appendtonu(s1,part2) |> nfkc

    else
        (s1 * part2) |> nfkc
    end
end

"""Append string `s2` to a string ending in ν, `s1`.
$(SIGNATURES)
"""
function lg_appendtonu(s1::AbstractString, s2::AbstractString)
    if ! occursin(r"^[πβφψκγχξμλρ]", s2)
        s1 * s2
        
    elseif occursin(r"^[πβφ]", s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"μ", s2)

    elseif occursin(r"^[κγχξ]", s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"γ", s2)

    elseif startswith(s2, "μ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"μ", s2)

    elseif startswith(s2, "λ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"λ", s2)

    elseif startswith(s2, "ρ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"ρ", s2)

    end

end

"""Append string `s2` to a string ending in a palatal, `s1`.
$(SIGNATURES)
"""
function lg_appendtopalatal(s1::AbstractString, s2::AbstractString)
    #=if lginitialrough(s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"χ", s2)

    else=#
    if ! occursin(r"^[μστδθ]", s2)
        s1 * s2
        
    elseif startswith(s2, "μ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"γ", s2)

    elseif startswith(s2, "σ")
        indices1 = collect(eachindex(s1))
        quit1 = indices1[end - 1]

        if length(s2) == 1
            string(s1[1:quit1],"ξ")
        else
            indices2 = collect(eachindex(s2))
            start2 = indices2[2]
            string(s1[1:quit1],"ξ", s2[start2:end])        
        end

    elseif startswith(s2, "τ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"κ", s2)

    elseif startswith(s2, "δ")
        quit = indices[end - 1]
        string(s1[1:quit],"γ", s2)

    elseif startswith(s2, "θ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"χ", s2)
    end
end

"""Append string `s2` to a string ending in a dental, `s1`.
$(SIGNATURES)
"""
function lg_appendtodental(s1::AbstractString, s2::AbstractString)
    if lginitialrough(s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        @debug("Reducing s1 to ",string(s1[1:quit],"θ"))
        string(s1[1:quit],"θ",  rmbreathing(s2,literaryGreek()))

    elseif ! occursin(r"^[τδθ]", s2)
        s1 * s2
    else
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"σ", s2)
    end
end


"""Append string `s2` to a string ending in a labial, `s1`.
$(SIGNATURES)
"""
function lg_appendtolabial(s1::AbstractString, s2::AbstractString)
    @debug("Appending to labial: look at ", s2)
    if lginitialrough(s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        @debug("Reducing s1 to ",string(s1[1:quit],"θ"))
        string(s1[1:quit],"φ", rmbreathing(s2,literaryGreek()))

    elseif ! occursin(r"^[μστδθ]", s2)
        s1 * s2

    elseif startswith(s2, "μ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"μ", s2)

    elseif startswith(s2, "σ")
        indices1 = collect(eachindex(s1))
        quit1 = indices1[end - 1]
        if length(s2) == 1
            string(s1[1:quit1],"ψ")
        else
            indices2 = collect(eachindex(s2))
            start2 = indices2[2]
            string(s1[1:quit1],"ψ", s2[start2:end])        
        end

    elseif startswith(s2, "τ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"π", s2)

    elseif startswith(s2, "δ")
        quit = indices[end - 1]
        string(s1[1:quit],"β", s2)

    elseif startswith(s2, "θ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"φ", s2)


    end
end