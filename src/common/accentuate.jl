"""Strip vowel quantity marker from `s`.

$(SIGNATURES)
"""
function stripquant(s::AbstractString)
    replace(s, "_" => "")
end

"""
Remove all accent characters from `s`.

$(SIGNATURES)

# Parameters

- `s` is a Greek string
- `ortho` is an implementation of `GreekOrthography`
"""
function rmaccents(s::AbstractString; ortho = literaryGreek())
    stripped = []
    dict = accentstripdict(ortho)
    for c in nfkc(s)
        if c in keys(dict)
            push!(stripped, dict[c])
        else
            push!(stripped,c)
        end
    end
    join(stripped,"")
end


function accentword(s::AbstractString)
end


function longsyllable(s::AbstractString)
    longsyllable(s, literaryGreek())
end
