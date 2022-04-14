"Work with polytonic Greek."
module PolytonicGreek

using Documenter, DocStringExtensions
using Unicode
using Orthography


import Orthography: OrthographyTrait
import Orthography: tokentypes 
import Orthography: codepoints 
import Orthography: tokenize


include("common/abstract.jl")
include("litgreek/lgortho.jl")

include("common/accentuate.jl")
include("common/accentdicts.jl")
include("common/syllabify.jl")
include("common/augment.jl")

include("litgreek/lgconstants.jl")
include("litgreek/lgaccentdicts.jl")
include("litgreek/lgaccentuate.jl")
include("litgreek/lgsyllabify.jl")
include("litgreek/ucodeutils.jl")
include("litgreek/lgclitics.jl")
include("litgreek/lgaugment.jl")



export GreekOrthography, vowels, consonants
export augment, augment_initial, augment_medial
export LiteraryGreekOrthography, literaryGreek
export tokentypes, codepoints
export tokenizeLiteraryGreek
export rmaccents, countaccents
export accentword, accentpenult, accentultima
export syllabify
export sortWords


end # module

