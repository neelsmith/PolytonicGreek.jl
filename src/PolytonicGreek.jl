"Work with polytonic Greek."
module PolytonicGreek

using Documenter
using Orthography, Unicode

include("constants.jl")
include("accentdicts.jl")
include("accentuate.jl")
include("ucodeutils.jl")

export rmaccents, accentword


end # module


#using Orthography, Unicode
#=
export LiteraryGreekOrthography 
export literaryGreek, tokenizeLiteraryGreek
export rmaccents, flipaccent, tokenaccent
export syllabify
export accentsyllable, accentword
export accentpenult, accentantepenult, accentultima
export nfkc

include("ortho.jl")

include("syllabify.jl")
include("utils.jl")
=#
