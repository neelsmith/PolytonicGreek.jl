### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 07723886-6564-11eb-2f61-65638d4bfb6c
begin
	using Pkg
	Pkg.activate(".")
	Pkg.instantiate()
	
	using Markdown
	using PlutoUI
	using Unicode
	using PolytonicGreek
end


# ╔═╡ 3da4ca0a-6565-11eb-1b92-b9c1553f3223
md"Define environment in hidden cell."

# ╔═╡ ee5aa2c2-6563-11eb-1f3a-6b907e19fd31
md"# Introduction to `LiteraryGreekOrthography`"

# ╔═╡ 7dcc46bc-656a-11eb-0f29-01dd8a59d645
md"""
Load the library:

```julia
using PolytonicGreek
```

"""

# ╔═╡ 937d959e-656a-11eb-2303-7da51f1b0482
md"""

## Tokenization 

Tokenize a string:

```julia
str = "Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"
tkns = tokenizeLiteraryGreek(str)
```
"""

# ╔═╡ 5c89aa08-656a-11eb-3d95-cb47ee3892aa
str = "Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"

# ╔═╡ 6d3f90a6-656a-11eb-14d9-2b229f0d6a11
tkns = tokenizeLiteraryGreek(str)

# ╔═╡ c9fb0c94-656a-11eb-2c35-5189c1360656
md"Tokens have a string value and a category."

# ╔═╡ d3c8c950-656a-11eb-1ff4-ebd936142caf
begin
	items = map(t -> "1. **" * t.text * "** (*$(t.tokencategory)*)", tkns)
	itemstring = join(items, "\n")
	Markdown.parse("**Tokens**:\n" * itemstring)
end

# ╔═╡ e0518030-656b-11eb-0258-9756bc71d49f
md"""
## Orthographic categorization and validation

All characters are precomposed in Unicode form NFKC
"""

# ╔═╡ 081371e6-656c-11eb-2f79-bf0067480cd6
md"Recognize category of a string"

# ╔═╡ 131640be-656c-11eb-1e3f-7967f02c46a4
PolytonicGreek.isPunctuation(";")

# ╔═╡ 2515ee86-656c-11eb-1bcf-bd862a853538
PolytonicGreek.isAlphabetic("μῆνιν")

# ╔═╡ 14d71e8a-656e-11eb-2eee-092306f81a29
md"""

---
"""

# ╔═╡ 1c93f238-656e-11eb-11ed-5df25da03158
md"All recognized punctuation characters:"

# ╔═╡ 2557a112-656e-11eb-2046-9361e24dcccc
PolytonicGreek.punctuation()

# ╔═╡ b8a3cb52-656a-11eb-0523-034cb44b8955
md"""

All recognized alphabetic characters (in Unicode order):
"""

# ╔═╡ 9bc2dfda-656c-11eb-284e-5750c39f56db
md"""

*Display one character per line*: $(@bind byline CheckBox())

"""

# ╔═╡ 07d856cc-6573-11eb-2f25-af7805e01de6
md">Some formatting functions"

# ╔═╡ 1b37606a-6572-11eb-265d-796b2e421c17
function ucat(cp) 
	if Unicode.isnumeric(cp)
		"numeric"
	elseif Unicode.ispunct(cp)
		"punctuation"
	elseif Unicode.isletter(cp)
		"letter"
	else
		"uncrecognized category"
	end
end
	

# ╔═╡ c35e1238-656e-11eb-2092-85f48cdc3bab
function stringinfo(s)
	#string(s,  " (" , length(s) , ")")

		
	uc = Unicode.islowercase(s[begin]) ? "lowercase" : "uppercase"
	
	string("**", s, "** (*Unicode ", codepoint(s[begin]) , ", ", ucat(s[begin]), " ", uc,  "*)")

end

# ╔═╡ 56830e2c-656c-11eb-0a42-b59d378ee995
begin
	if byline
		
		chlist = []
		for ch in PolytonicGreek.alphabetic() 
			push!(chlist, "- " * stringinfo(ch))
		end
		Markdown.parse(join(chlist,"\n"))
	else
		md"$(PolytonicGreek.alphabetic())"
		
	end
end

# ╔═╡ Cell order:
# ╟─3da4ca0a-6565-11eb-1b92-b9c1553f3223
# ╟─07723886-6564-11eb-2f61-65638d4bfb6c
# ╟─ee5aa2c2-6563-11eb-1f3a-6b907e19fd31
# ╟─7dcc46bc-656a-11eb-0f29-01dd8a59d645
# ╟─937d959e-656a-11eb-2303-7da51f1b0482
# ╟─5c89aa08-656a-11eb-3d95-cb47ee3892aa
# ╟─6d3f90a6-656a-11eb-14d9-2b229f0d6a11
# ╟─c9fb0c94-656a-11eb-2c35-5189c1360656
# ╟─d3c8c950-656a-11eb-1ff4-ebd936142caf
# ╟─e0518030-656b-11eb-0258-9756bc71d49f
# ╟─081371e6-656c-11eb-2f79-bf0067480cd6
# ╠═131640be-656c-11eb-1e3f-7967f02c46a4
# ╠═2515ee86-656c-11eb-1bcf-bd862a853538
# ╟─14d71e8a-656e-11eb-2eee-092306f81a29
# ╟─1c93f238-656e-11eb-11ed-5df25da03158
# ╠═2557a112-656e-11eb-2046-9361e24dcccc
# ╟─b8a3cb52-656a-11eb-0523-034cb44b8955
# ╟─9bc2dfda-656c-11eb-284e-5750c39f56db
# ╟─56830e2c-656c-11eb-0a42-b59d378ee995
# ╟─07d856cc-6573-11eb-2f25-af7805e01de6
# ╟─c35e1238-656e-11eb-2092-85f48cdc3bab
# ╟─1b37606a-6572-11eb-265d-796b2e421c17
