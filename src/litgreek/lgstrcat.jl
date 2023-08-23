"""Concatenate `s1` and `s2` d, taking account of necessary phonological modifications.

$(SIGNATURES)
"""
function strcat(ortho::LiteraryGreekOrthography, s1::AbstractString,s2::AbstractString; elision = false)
    
    @info("Strcatting $(s1) and $(s2)")
    part2 = rmbreathing(s2, ortho)
    s1 = elision ? elide(s1, part2, ortho) : s1
    @debug("strcat: After elision, s1 is ", s1)
    
    if isempty(s1)
        s2
    elseif isempty(s2)
        s1

    elseif rough(s2, ortho)
        @debug("$(s2) is rough")
        @debug("Aspirated: ", aspiratefinal(s1, ortho))
        aspiratefinal(s1, ortho) * part2 |> nfkc
    
    elseif occursin(r"[πβφ]$", s1)
        lg_appendtolabial(s1,part2) |> nfkc

    elseif occursin(r"[τδθ]$", s1)
        @debug("Cat")
        lg_appendtodental(s1,part2) |> nfkc

    elseif occursin(r"[κγχ]$", s1)
        lg_appendtopalatal(s1,part2) |> nfkc

    elseif endswith(s1, "ν")
        @debug("strcat: append to nu")
        lg_appendtonu(s1,part2) |> nfkc

    else
        (s1 * part2) |> nfkc
    end
end



"""Append string `s2` to a string ending in ν, `s1`.
$(SIGNATURES)
"""
function lg_appendtonu(s1::AbstractString, s2::AbstractString)
    @debug("Appending to nu, $(s2) to $(s1)")
    
    indices = collect(eachindex(s1))
    @debug("Indices $(indices)")
    if isempty(s1)
        s2
    else
        quit =  length(s1) > 1  ? indices[end - 1] : indices[1]
    end

    if ! occursin(r"^[πβφψκγχξμλρ]", s2)
        s1 * s2

    elseif occursin(r"^[πβφ]", s2)
        string(s1[1:quit],"μ", s2)

    elseif occursin(r"^[κγχξ]", s2)        
        string(s1[1:quit],"γ", s2)

    elseif startswith(s2, "μ")
        string(s1[1:quit],"μ", s2)

    elseif startswith(s2, "λ")
        string(s1[1:quit],"λ", s2)

    elseif startswith(s2, "ρ")
        string(s1[1:quit],"ρ", s2)

    elseif occursin(r"^γκχ", s2)
        string(s1[1:quit], "γ", s2)

    end

end

"""Append string `s2` to a string ending in a palatal, `s1`.
$(SIGNATURES)
"""
function lg_appendtopalatal(s1::AbstractString, s2::AbstractString)
    @info("Appending str to palatal")
    # Aspirate s1 if s2 starts with rough breathing:
    if lginitialrough(s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        @debug("Reducing s1 to ",string(s1[1:quit],"χ"))
        string(s1[1:quit],"χ",  rmbreathing(s2,literaryGreek()))

    #   if next syllable starts with σθ, drop σ
    #  and aspirate the palatal
    elseif startswith(s2, "σθ")    
        indices1 = collect(eachindex(s1))
        quit1 = indices1[end - 1]

        indices2 = collect(eachindex(s2))
        start2 = indices2[2]

        string(s1[1:quit1], aspirate(s1[indices1[end]]), s2[start2:end] )
        

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
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"γ", s2)

    elseif startswith(s2, "θ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"χ", s2)

    elseif occursin(r"[χκ]$", s1) && occursin(r"^[κγχ]", s2)
        if length(s2) == 1
            indices = collect(eachindex(s1))
            quit = indices[end - 1]
            string(s1[1:quit],"χ")
        else
            indices = collect(eachindex(s2))
            quit = indices[2:end]
            indices2 = collect(eachindex(s2))
            start2 = indices2[2]
            string(s1, s2[start2:end])
        end

    else
        s1 * s2
    end
end

"""Append string `s2` to a string ending in a dental, `s1`.
$(SIGNATURES)
"""
function lg_appendtodental(s1::AbstractString, s2::AbstractString)
    @debug("Appending dental $(s1) and $(s2)")

    # Aspirate dental if next syllable starts with rough breathing:
    if lginitialrough(s2)
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        @debug("Reducing s1 to ",string(s1[1:quit],"θ"))
        string(s1[1:quit],"θ",  rmbreathing(s2,literaryGreek()))

    # if next syllable starts with σθ, drop σ
    #  and aspirate dental
    elseif startswith(s2, "σθ")
        indices1 = collect(eachindex(s1))
        quit1 = indices1[end - 1]

        indices2 = collect(eachindex(s2))
        start2 = indices2[2]

        string(s1[1:quit1], aspirate(s1[indices1[end]]), s2[start2:end] )

    # when an aspirated dental is followed by another dental,
    # replace it with ς  
    elseif endswith(s1, "θ") && occursin(r"^[τδθ]", s2)
        if length(s2) == 1
            s1
        else
            indices = collect(eachindex(s1))
            quit = indices[end - 1]
            string(s1[1:quit],"σ", s2)
        end
    # Just cat the two together:
    else
        s1 * s2
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

    elseif startswith(s2, "σθ")
        @debug("STARTING σθ")
        indices1 = collect(eachindex(s1))
        quit1 = indices1[end - 1]

        indices2 = collect(eachindex(s2))
        start2 = indices2[2]

        string(s1[1:quit1], aspirate(s1[indices1[end]]), s2[start2:end] )
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