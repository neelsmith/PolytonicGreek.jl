# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Documenter, DocStringExtensions
using PolytonicGreek

makedocs(
    sitename = "PolytonicGreek.jl",
    pages = [
        "Home" => "index.md",
        "Manual" => Any[
            "guide/orthography.md",
            "guide/sorting.md",
            "guide/accents.md",
            "guide/syllabification.md",
            "utilities.md"
        ],
        "API documentation" => "api/index.md"
    ]
)


deploydocs(
    repo = "github.com/neelsmith/PolytonicGreek.jl.git",
) 