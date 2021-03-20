module PolytonicGreek

using Documenter, DocStringExtensions
using Orthography, Unicode

export LiteraryGreekOrthography 
export literaryGreek, tokenizeLiteraryGreek
export showcps
export rmaccents, flipaccent, tokenaccent
export syllabify
export accentsyllable, accentword

include("ortho.jl")
include("constants.jl")
include("accentuate.jl")
include("accentdicts.jl")
include("syllabify.jl")
include("utils.jl")

end # module
