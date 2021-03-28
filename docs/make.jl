using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, DocStringExtensions
using PolytonicGreek


makedocs(
    sitename = "PolytonicGreek.jl",
    pages = [
        "Home" => "index.md",
        "Manual" => Any[
            "guide/orthography.md",
            "guide/accents.md",
            "guide/sorting.md",
            "guide/syllabification.md",
            "utilities.md"
        ],
        "API documentation" => "apis.md"
    ]
)