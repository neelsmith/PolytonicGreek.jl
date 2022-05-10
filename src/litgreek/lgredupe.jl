


"""Reduplicate `s`, taking account of any necessary phonological
modifications.

$(SIGNATURES)
"""
function reduplicate(s::AbstractString, ortho::LiteraryGreekOrthography)
    normalized = nfkc(s) |> rmaccents
    # 1. initial γν / γλ
    if occursin(r"^γ[νλ]", normalized)
        #augment_initial(ortho) * normalized
        augment(normalized, ortho)

    elseif occursin(r"^[ξψζ]", normalized)
        augment(normalized, ortho)
        
    elseif occursin(r"^[πβφτδθκγχ][λμνρ]", normalized)
        # simple case:
        normalized[1] * "ε" * normalized
        
    elseif startswith(normalized,"φ")
        "πε" * normalized

    elseif startswith(normalized,"χ")
        "κε" * normalized

    elseif startswith(normalized,"θ")
        "τε" * normalized

    else
        consonlist = consonants(ortho)
        multiconson = Regex("^[$consonlist][$consonlist]+")
        if occursin(multiconson, normalized)
            augment(normalized, ortho)

        elseif normalized[1] in consonlist
            normalized[1] * "ε" * normalized
        else
            augment(normalized, ortho)
        end        
    end
end