# Manipulate accents.

"""Remove all accent characters from `s`."""
function rmaccents(s)
    stripped = []
    dict = accentdict()
    for c in Unicode.normalize(s, :NFKC)
        if c in keys(dict)
            push!(stripped, dict[c])
        else
            push!(stripped,c)
        end
    end
    join(stripped,"")
end


"""Remove any second enclitic accent from `s`."""
function stripenclitic(s)
    nothing
end

abstract type AccentPlacement end
struct Recessive <: AccentPlacement
    label
end

struct Ultima <: AccentPlacement
    label
end

struct Penult <: AccentPlacement
    label
end


"""Add accent to `s` for specified accent placement."""
function addaccent(s, placement::AccentPlacement)
end