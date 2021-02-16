### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 07723886-6564-11eb-2f61-65638d4bfb6c
begin
	using Pkg
	Pkg.activate(".")
	Pkg.instantiate()

	using Unicode
end


# ╔═╡ ee5aa2c2-6563-11eb-1f3a-6b907e19fd31
md"""# Unicode Greek in Julia

Julia's rational handling of Unicode makes the specialized functions for handling Unicode Greek in other programming languages unnecessary.

"""

# ╔═╡ 7dcc46bc-656a-11eb-0f29-01dd8a59d645
md"""
The Unicode library is part of the Julia language, but is a separate module you need to import:

```julia
using Unicode
```

"""

# ╔═╡ 5c89aa08-656a-11eb-3d95-cb47ee3892aa
str = "Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"

# ╔═╡ 86aadb8e-706b-11eb-3b18-211011071ef8
md"### Manipulate case and diacritics"

# ╔═╡ 5b481916-706b-11eb-3292-795a440eba94
uppercase(str)

# ╔═╡ 694016a4-706b-11eb-0186-b5fea6097fd5
lowercase(str)

# ╔═╡ 55600022-706b-11eb-1085-9dd4f80a1a00
 Unicode.normalize(str, stripmark=true)

# ╔═╡ 7458f6b4-706b-11eb-251d-cbf129858cbf
uppercase(Unicode.normalize(str, stripmark=true))

# ╔═╡ 93198604-706b-11eb-2c5f-1f6fd8b10497
md"### Normalization"

# ╔═╡ 43b0fe6c-706b-11eb-0a37-edb90097af18
md"Canonical composed form:"

# ╔═╡ 9b3a12a4-706b-11eb-1209-1d22f68261fa
length(Unicode.normalize(str, :NFKC))

# ╔═╡ 282c371e-706c-11eb-22d5-d300f25c2d8e
md"Canonical decomposed form:"

# ╔═╡ 1b72382a-706c-11eb-0835-652056506755
length(Unicode.normalize(str, :NFKD))

# ╔═╡ 5d4aa5de-706c-11eb-10db-5bb6f7bd7dfd
md"### Chars, codepoints, graphemes"

# ╔═╡ b98d40f4-706c-11eb-2054-7d1a503743ab
md"(See [these docs](https://docs.julialang.org/en/v1/manual/strings/) for orientation to using Strings in Julia.)"

# ╔═╡ e421f2ba-706c-11eb-2176-a5ccdd6a30c0
composed = Unicode.normalize(str, :NFKC)

# ╔═╡ ecd965fa-706c-11eb-367b-31b1a4f0efc2
decomposed = Unicode.normalize(str, :NFKD)

# ╔═╡ 132a6f92-706d-11eb-1cdf-270210016a03
md"The `eachindex` iterator gives you valid indexes into a string's *codepoints*, which might or might not be the same as indexing into its bytes."

# ╔═╡ 79a72ec8-706c-11eb-38a1-ed424a15650e
length(collect(eachindex(decomposed)))

# ╔═╡ 263e5bd4-706d-11eb-27b0-252af2b8649c
length(collect(eachindex(composed)))

# ╔═╡ 0746d0c6-706d-11eb-1384-7508b7bdaeb5
md"But `graphemes` iterates through meaningful graphemes (which may be more than code point)"

# ╔═╡ 65c55344-706c-11eb-3c0f-6ff126265992
length(collect(graphemes(composed)))

# ╔═╡ fa4cfee0-706c-11eb-1db2-893a061820bf
length(collect(graphemes(decomposed)))

# ╔═╡ 08bc3e30-706f-11eb-2c5e-415eea72d60d
md"### What iterators yield"

# ╔═╡ 9a831cfa-706d-11eb-31a2-ef232bd4ad34
md"The `grapheme` iterator gives you efficient substrings of the source string"

# ╔═╡ 4dd01b88-706d-11eb-27fa-13a4414e0297
begin 
	gs = []
	for g in graphemes(composed)
		push!(gs, string(g, " (", typeof(g), ")"))
	end
	gs
end

# ╔═╡ 60356354-706e-11eb-2e0c-f5d40e3e964b
md"Iterating  directly on a string yields `Char`s."

# ╔═╡ db1bee9e-706e-11eb-2401-ff8e5dc43c80
begin 
	cs = []
	for c in composed
		push!(cs, string(c, " (", typeof(c), ")"))
	end
	cs
end

# ╔═╡ a5e46f4a-706d-11eb-2c0b-376a70ea5052
length(collect(eachindex(decomposed)) )

# ╔═╡ 316d3cf4-706c-11eb-1c94-0d47ed01e6ae
md"### Sorting"

# ╔═╡ 3953686e-706c-11eb-0770-fd86b01a6bf9
md"Alas, sorting has to follow the sequence of codepoints defined in the Unicode spec.  A rational sorting function needs to be added to the `PolytonicGreek` library."

# ╔═╡ 531f5d54-706c-11eb-1b2d-af45c8e8b7a9


# ╔═╡ Cell order:
# ╟─07723886-6564-11eb-2f61-65638d4bfb6c
# ╟─ee5aa2c2-6563-11eb-1f3a-6b907e19fd31
# ╟─7dcc46bc-656a-11eb-0f29-01dd8a59d645
# ╟─5c89aa08-656a-11eb-3d95-cb47ee3892aa
# ╟─86aadb8e-706b-11eb-3b18-211011071ef8
# ╠═5b481916-706b-11eb-3292-795a440eba94
# ╠═694016a4-706b-11eb-0186-b5fea6097fd5
# ╠═55600022-706b-11eb-1085-9dd4f80a1a00
# ╠═7458f6b4-706b-11eb-251d-cbf129858cbf
# ╟─93198604-706b-11eb-2c5f-1f6fd8b10497
# ╟─43b0fe6c-706b-11eb-0a37-edb90097af18
# ╠═9b3a12a4-706b-11eb-1209-1d22f68261fa
# ╟─282c371e-706c-11eb-22d5-d300f25c2d8e
# ╠═1b72382a-706c-11eb-0835-652056506755
# ╟─5d4aa5de-706c-11eb-10db-5bb6f7bd7dfd
# ╟─b98d40f4-706c-11eb-2054-7d1a503743ab
# ╠═e421f2ba-706c-11eb-2176-a5ccdd6a30c0
# ╠═ecd965fa-706c-11eb-367b-31b1a4f0efc2
# ╟─132a6f92-706d-11eb-1cdf-270210016a03
# ╠═79a72ec8-706c-11eb-38a1-ed424a15650e
# ╠═263e5bd4-706d-11eb-27b0-252af2b8649c
# ╟─0746d0c6-706d-11eb-1384-7508b7bdaeb5
# ╠═65c55344-706c-11eb-3c0f-6ff126265992
# ╠═fa4cfee0-706c-11eb-1db2-893a061820bf
# ╟─08bc3e30-706f-11eb-2c5e-415eea72d60d
# ╠═9a831cfa-706d-11eb-31a2-ef232bd4ad34
# ╠═4dd01b88-706d-11eb-27fa-13a4414e0297
# ╠═60356354-706e-11eb-2e0c-f5d40e3e964b
# ╠═db1bee9e-706e-11eb-2401-ff8e5dc43c80
# ╠═a5e46f4a-706d-11eb-2c0b-376a70ea5052
# ╟─316d3cf4-706c-11eb-1c94-0d47ed01e6ae
# ╟─3953686e-706c-11eb-0770-fd86b01a6bf9
# ╠═531f5d54-706c-11eb-1b2d-af45c8e8b7a9
