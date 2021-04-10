"Work with polytonic Greek."
module PolytonicGreek

using Documenter, DocStringExtensions
using Orthography, Unicode

include("common/abstract.jl")
include("litgreek/lgortho.jl")

include("common/accentuate.jl")
include("common/accentdicts.jl")
include("common/syllabify.jl")

include("litgreek/lgconstants.jl")
include("litgreek/lgaccentdicts.jl")
include("litgreek/lgaccentuate.jl")
include("litgreek/lgsyllabify.jl")
include("litgreek/ucodeutils.jl")
include("litgreek/simplecategories.jl")

export vowels, consonants
export LiteraryGreekOrthography, literaryGreek
export tokenizeLiteraryGreek
export rmaccents, accentword
export syllabify


end # module

