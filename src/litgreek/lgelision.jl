

"""Compare `s1` and `s2`, and elide `s1`
if necessary.

$(SIGNATURES)
"""
function elide(s1::AbstractString, s2::AbstractString, ortho::LiteraryGreekOrthography)
    codepts =  graphemes(s1) |> collect
    if vocalic(codepts[end]) && 
        vocalic(s2[1]) &&
        ! (endswith(s1, "περι")) &&
        ! (endswith(s1, "προ"))
        
        join(codepts[1:end-1])
        
    else
        s1
    end
end