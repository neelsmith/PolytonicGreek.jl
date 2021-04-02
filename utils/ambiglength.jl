ambig = []
ambiguous = for c in PolytonicGreek.LG_VOWELS
    if ! occursin(c, PolytonicGreek.LG_LONGVOWELS)
       push!(ambig,c)
    end
end

using Unicode
normed = Unicode.normalize(join(ambig,""), :NFKC)

"αιυἀἰὐἁἱὑϊϋ"