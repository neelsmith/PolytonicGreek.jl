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
        "Greek orthography" => Any[
            "guide/orthography.md",
            "guide/orthography-details.md",
            "guide/sorting.md",
            "guide/accents.md",
            "guide/syllabification.md",
            "utilities.md"
        ],
        "The LiteraryGreek implementation" => Any[
              "litgreek/ortho.md"
        ],
        "API documentation" => "api/index.md"
    ]
)


deploydocs(
    repo = "github.com/neelsmith/PolytonicGreek.jl.git",
) 