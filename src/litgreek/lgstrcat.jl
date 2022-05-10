


"""Concatenate `s1` and `s2` d, taking account of necessary phonological modifications.

$(SIGNATURES)
"""
function strcat(s1::AbstractString,s2::AbstractString,ortho::LiteraryGreekOrthography)
   if occursin(r"[πβφ]$", s1)
    lg_appendtolabial(s1,s2)

   else
    s1 * s2
   end
end


function lg_appendtolabial(s1, s2)
    if ! occursin(r"^[μσ]", s2)
        s1 * s2
        
    elseif startswith(s2, "μ")
        indices = collect(eachindex(s1))
        quit = indices[end - 1]
        string(s1[1:quit],"μ", s2)

    elseif startswith(s2, "σ")
        indices1 = collect(eachindex(s1))
        quit1 = indices1[end - 1]
        indices2 = collect(eachindex(s2))
        start2 = indices2[2]
        string(s1[1:quit1],"ψ", s2[start2:end])        
    end
end