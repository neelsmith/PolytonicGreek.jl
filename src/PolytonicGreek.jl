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



include("common/accentuate.jl")
include("common/accentdicts.jl")
include("common/syllabify.jl")
include("common/augment.jl")
include("common/phonology.jl")


include("litgreek/lgortho.jl")
include("litgreek/lgconstants.jl")
include("litgreek/lgaccentdicts.jl")

include("litgreek/lgaccentuate.jl")
include("litgreek/lgsyllabify.jl")
include("litgreek/ucodeutils.jl")
include("litgreek/lgclitics.jl")
include("litgreek/lgaugment.jl")
include("litgreek/lgsyllaccent.jl")
include("litgreek/lgphonology.jl")
include("litgreek/lgredupe.jl")
include("litgreek/lgstrcat.jl")
include("litgreek/lgbreathing.jl")


export GreekOrthography
export vowels, consonants
export liquids, labials, dentals, palatals, stops
export proclitics, enclitics
export rmbreathing, addbreathing

export rmaccents, countaccents
export accentword, accentpenult, accentultima

export augment, augment_initial, augment_medial

export vocalic, consonantal, accented
export strcat
export reduplicate

export syllabify
export sortWords


export LiteraryGreekOrthography, literaryGreek
export tokentypes, codepoints

export nfkc


end # module

