using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, DocStringExtensions, PolytonicGreek

makedocs(sitename = "PolytonicGreek Documentation")
