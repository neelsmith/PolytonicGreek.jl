


"""Reduplicate `s`, taking account of any necessary phonological
modifications.

$(SIGNATURES)
"""
function reduplicate(s::AbstractString, ortho::LiteraryGreekOrthography)
    normalized = nfkc(s) |> rmaccents
    normalized
end