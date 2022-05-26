

"""Compare `s1` and `s2`, and elide `s1`
if necessary.

$(SIGNATURES)
"""
function elide(s1::AbstractString, s2::AbstractString, ortho::LiteraryGreekOrthography)
    if isempty(s1)
        s2
    elseif isempty(s2)
        s1
    else
        split(LG_CONSONANTS)
        finalshort = r"[βγδζθκλμνξπρστφχψ][αειο]$"
        codepts =  graphemes(s1) |> collect
        if  vocalic(s2[1]) && occursin(finalshort, s1) &&
            ! (endswith(s1, "περι")) &&
            ! (endswith(s1, "προ"))

            join(codepts[1:end-1])

        elseif s1 == "εκ" && vocalic(s2[1])
            "εξ"


        elseif s1 == "ἐκ" && vocalic(s2[1])
            @debug("s1, s2", s1, s2)
            "ἐξ" |> nfkc

        else
            s1
        end
    end
end