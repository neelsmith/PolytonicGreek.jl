"Work with polytonic Greek."
module PolytonicGreek

using Documenter, DocStringExtensions
using Orthography, Unicode

include("constants.jl")
include("ucodeutils.jl")
include("ortho.jl")
include("accentdicts.jl")
include("accentuate.jl")
include("syllabify.jl")
include("utils.jl")

export LiteraryGreekOrthography, literaryGreek
export tokenizeLiteraryGreek
export rmaccents, accentword
export syllabify
export nfkc

end # module

#=

export syllabify
export accentsyllable, accentword
export accentpenult, accentantepenult, accentultima
export nfkc

include("ortho.jl")

include("syllabify.jl")
include("utils.jl")
=#
