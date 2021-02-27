module PolytonicGreek

using Documenter, DocStringExtensions
using Orthography, Unicode

export LiteraryGreekOrthography
export literaryGreek, tokenizeLiteraryGreek

include("ortho.jl")
include("utils.jl")

end # module
