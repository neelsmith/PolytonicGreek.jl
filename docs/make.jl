using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, DocStringExtensions, Greek

makedocs(sitename = "Greek Documentation")
