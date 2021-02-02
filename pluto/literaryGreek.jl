### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 07723886-6564-11eb-2f61-65638d4bfb6c
begin
	using Pkg
	Pkg.activate(".")
	#Pkg.add("PolytonicGreek")
	# using PolytonicGreek
	
	Pkg.add(url="https://github.com/neelsmith/PolytonicGreek.jl")
	using PolytonicGreek
end


# ╔═╡ 3da4ca0a-6565-11eb-1b92-b9c1553f3223
md"Define environment in hidden cell."

# ╔═╡ ee5aa2c2-6563-11eb-1f3a-6b907e19fd31
md"Walkthrough of `LiteraryGreekOrthography`"

# ╔═╡ Cell order:
# ╟─3da4ca0a-6565-11eb-1b92-b9c1553f3223
# ╠═07723886-6564-11eb-2f61-65638d4bfb6c
# ╟─ee5aa2c2-6563-11eb-1f3a-6b907e19fd31
