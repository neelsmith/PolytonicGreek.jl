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
        @debug("Looking for augment in ", join(keys(augmentdict), "-"))
        for k in keys(augmentdict)
            re = Regex("^$(k)")
            augmented = replace(augmented, re => augmentdict[k])
            @debug(augmented)
        end
        @debug("RETURN", augmented)
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
    morphemes = splitmorphemes(normalized)

    if length(morphemes) > 1
        @debug("$(s) has multiple morphemes")
        augpiece = rmbreathing(applyaugment(morphemes[end], ortho), ortho)
        @info("Last pieces augmented", augpiece)
        
        
        prepend = join(morphemes[1:end-1])
        @info("Prepend $(prepend)")
        
        cplist = collect(graphemes(prepend))
        if occursin(cplist[end], vowels(ortho))
            prepend = join(cplist[1:end-1])
        end
        
        if endswith(prepend,"εκ") || endswith(prepend,nfkc("ἐκ"))
            prepend = replace(prepend, r"κ$" => "ξ")
            strcat(prepend * "#", augpiece, ortho)
        else
            @info("Cat $(prepend) and $(augpiece)")
            strcat(prepend * "#", augpiece, ortho)
        end

    else
        # simplex verb:
        applyaugment(s, ortho)
    end
end

function applyaugment(s,ortho)
    codepts =  graphemes(s) |> collect
    if s[1] == 'ῥ'
        if length(codepts) < 2
            s = "ἐρρ" |> nfkc
        else    
            s = string("ἐρρ", join(codepts[2:end], "")) |> nfkc
        end

    elseif s[1] in PolytonicGreek.LG_CONSONANTS
        s =  string("ἐ", join(codepts, "")) |> nfkc

    else 
        # not a consonant, so must be a vowel.
        # check first for multi-char diphthongs
        diphthongs = augmentdiphthong(s)
        if diphthongs != s
            @debug "Normalized changed to $s"
            s = diphthongs

        else  # not a diphthong, so:
            @debug("AUGMENT VOWEL")
            s = augmentvowel(s)   
        
        end
    end
    s
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