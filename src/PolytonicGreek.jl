"Work with polytonic Greek."
module PolytonicGreek

using Documenter, DocStringExtensions
using Unicode
using Orthography

import Orthography: tokentypes 
import Orthography: codepoints 


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



export GreekOrthography, vowels, consonants
export LiteraryGreekOrthography, literaryGreek
export tokentypes, codepoints
export tokenizeLiteraryGreek
export rmaccents, accentword
export syllabify


end # module

