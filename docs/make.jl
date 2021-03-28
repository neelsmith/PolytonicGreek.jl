# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()
#push!(LOAD_PATH,"../src/")


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
        "API documentation" => Any[
            "api/apis_ortho.md",
            "api/apis_sorting.md",
            "api/apis_accents.md",
            "api/apis_syllables.md",
            "api/apis_other.md",
            
        ]
    ]
)
