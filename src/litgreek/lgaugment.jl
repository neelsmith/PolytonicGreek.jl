
function augmentdiphthong(s)
    augmented = s
    augmentdict = lgdiphaugments()
    for k in keys(augmentdict)
        re = Regex("^$(k)")
        augmented = replace(augmented, re => augmentdict[k])
    end
    augmented
end

function augmentvowel(s)
    if startswith(s, "ἱ_") || startswith(s, "ἰ_") || startswith(s, "ὑ_") || startswith(s, "ὐ_")
        s
        
    else 
        augmented = s
        augmentdict = lgsimpleaugments()
        for k in keys(augmentdict)
            re = Regex("^$(k)")
            augmented = replace(augmented, re => augmentdict[k])
        end
        augmented
    end
end

"""Implementatiοn of GreekOrthography's augment function for literary Greek.

$(SIGNATURES)    

NB: `augment` removes all accents  from the resulting string.


# Parameters

- `ortho` An instance of a `GreekOrthography`
- `s` An optional string to augment.  If is not included, the function returns
a default augment string that can be applied to verb forms starting with a consonant
(except note that ρ doubles after augment in standard literary Greek orthography).
"""
function augment(ortho::LiteraryGreekOrthography; s = nothing)
    if isnothing(s)
        nfkc("ἐ")

    else
        normalized = nfkc(s) |> rmaccents
        codepts =  graphemes(normalized) |> collect
        if normalized[1] == 'ῥ'
            normalized = string("ἐρρ", join(codepts[2:end], "")) |> nfkc

        elseif normalized[1] in PolytonicGreek.LG_CONSONANTS
            normalized =  string("ἐ", join(codepts, "")) |> nfkc

        else # not a consonant, so must be a vowel! 
            # check first for multi-char diphthongs
            diphthongs = augmentdiphthong(normalized)
            if diphthongs != normalized
                @info "Normalized changed to $normalized"
                normalized = diphthongs

            else  # not a diphthong, so:
                normalized = augmentvowel(normalized)   
            
            end
        end
        normalized
    end
end