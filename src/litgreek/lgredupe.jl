


"""Reduplicate `s`, taking account of any necessary phonological
modifications.

$(SIGNATURES)
"""
function reduplicate(s::AbstractString, ortho::LiteraryGreekOrthography)
    normalized = nfkc(s) |> rmaccents
    morphemes = split(normalized,"#")

    if length(morphemes) > 1
        @debug("More than one morpheme")
        dupepiece = applyreduplication(morphemes[end], ortho)
        strcat(join(morphemes[1:end-1]), rmbreathing(dupepiece,ortho), ortho)
    else
        applyreduplication(s, ortho)
    end
    
end


function applyreduplication(normalized::AbstractString, ortho::LiteraryGreekOrthography)
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