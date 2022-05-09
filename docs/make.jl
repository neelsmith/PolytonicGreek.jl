# Run this from repository root, e.g. with
# 
#    julia --project=docs/ docs/make.jl
#
# You can test locally with LiveServer, e.g.,
#
#     julia  -e 'using LiveServer; serve(dir="docs/build")'
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
        "String manipulation" => Any[
            "guide/strcat.md",
            "guide/sorting.md",
            "guide/syllabification.md",
            "guide/accents.md",
            "guide/augment.md"
            
        ],
        "Greek orthography" => Any[
            "guide/orthography.md"
        ],
        "The LiteraryGreek implementation" => Any[
            "litgreek/lgstrings.md",
            "litgreek/lgortho.md",
            "litgreek/orthodetails.md"
        ],
        "API documentation" => "api/index.md"
    ]
)


deploydocs(
    repo = "github.com/neelsmith/PolytonicGreek.jl.git",
) 