"""Add temporal augment to diphthong `d`.
$(SIGNATURES)
"""
function augmentdiphthong(d)
    augmented = d
    augmentdict = lgdiphaugments()
    for k in keys(augmentdict)
        re = Regex("^$(k)")
        augmented = replace(augmented, re => augmentdict[k])
    end
    augmented
end

"""Add temporal augment to vowel `v`.
$(SIGNATURES)
"""
function augmentvowel(v)
    if startswith(v, "ἱ_") || startswith(v, "ἰ_") || startswith(v, "ὑ_") || startswith(v, "ὐ_")
        v
        
    else 
        augmented = v
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

- `ortho` An instance of a `LiteraryGreekOrthography`
- `s` An optional string to augment.  If is not included, the function returns
a default augment string that can be applied to verb forms starting with a consonant
(except note that ρ doubles after augment in standard literary Greek orthography).
"""
function augment(s::AbstractString, ortho::LiteraryGreekOrthography)
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
            @debug "Normalized changed to $normalized"
            normalized = diphthongs

        else  # not a diphthong, so:
            normalized = augmentvowel(normalized)   
        
        end
    end
    normalized
    
end


"""Identify string to use for syllabic augment in word-initial position.
$(SIGNATURES)
"""
function augment_initial(ortho::LiteraryGreekOrthography)
    nfkc("ἐ")
end

"""Identify string to use for syllabic augment in compound verb.
$(SIGNATURES)
"""
function augment_medial(ortho::LiteraryGreekOrthography)
    "ε"
end

#= Smyth 435: table of temporal augment
α, ε => η (αυ, ευ => ηυ)
αι, ει => ῃ
οι => ῳ
ι => ι
ο => ω
υ => υ
=#