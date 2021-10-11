"An orthographic system for standard orthography of printed literary Greek."
struct LiteraryGreekOrthography <: GreekOrthography
    codepoints
    tokencategories
end


OrthographyTrait(::Type{LiteraryGreekOrthography}) = IsOrthographicSystem()

"""Implement Orthography's codepoints functions for LiteraryGreekOrthography.

$(SIGNATURES)    
"""    
function tokenize(s::AbstractString, o::LiteraryGreekOrthography)
    tokenizeLiteraryGreek(s)
end


"""Implement Orthography's codepoints functions for LiteraryGreekOrthography.

$(SIGNATURES)    
"""    
function codepoints(ortho::LiteraryGreekOrthography)
    ortho.codepoints
end

"""Implement Orthography's tokentypes functions for LiteraryGreekOrthography.

$(SIGNATURES)    
"""    
function tokentypes(ortho::LiteraryGreekOrthography)
    ortho.tokencategories
end

"""
Instantiate a LiteraryGreekOrthography with correct code points and token types.

$(SIGNATURES)
"""
function literaryGreek()
    cps = alphabetic() * " \t\n" * punctuation()
    ttypes = [
        Orthography.LexicalToken,
        Orthography.PunctuationToken
    ]
    LiteraryGreekOrthography(cps, ttypes)
    #
    
  
end


"""Implement vowels function of GreekOrthography interface.

$(SIGNATURES)
"""
function vowels(ortho::LiteraryGreekOrthography)
    LG_VOWELS
end

"""Implement consonants function of GreekOrthography interface.

$(SIGNATURES)
"""
function consonants(ortho::LiteraryGreekOrthography)
    LG_CONSONANTS
end

"""Compose a string with all alphabetic characters.

$(SIGNATURES)
"""
function alphabetic()
    ranges = [
        '\u0027'; # single quote for elision
        'α':'ω'; 'Α':'Ρ' ; 'Σ':'Ω' ;
    'ϊ':'ώ'; 'ά'; 'έ'; 'ή' ; 'ί';'ΰ';'ΐ';
    '\u1f00':'\u1f15'; '\u1f18':'\u1f1d' ;
    '\u1f20':'\u1f45' ; '\u1f48':'\u1f4d' ; 
    '\u1f50':'\u1f57';  '\u1f59' ; '\u1f5b' ;
    '\u1f5d' ; '\u1f5f':'\u1f7d' ;
    '\u1f80':'\u1faf'; '\u1fb2':'\u1fb4' ;
    '\u1fb6':'\u1fbc'; 
	'\u1fc2':'\u1fc4';
    '\u1fc6':'\u1fcc';
    '\u1fd2':'\u1fd3'; '\u1fd6':'\u1fdb';
    '\u1fe2':'\u1fe7';
    '\u1fea':'\u1fec';
    '\u1ff2':'\u1ff4'; '\u1ff6':'\u1ffc'
    ]
    join(ranges,"")
end


"""Compose a string with all punctuation characters.

$(SIGNATURES)
"""
function punctuation()
    ".,;:"
end


"""
True if all characters in s are alphabetic.

$(SIGNATURES)    
"""
function isAlphabetic(s::AbstractString)
    chlist = split(s,"")
    alphas = alphabetic()
    tfs = []
    for i in collect(eachindex(s)) 
        push!(tfs, occursin(s[i], alphas))
    end
    tfs = map(c -> occursin(c, alphas), chlist)
    nogood = false in tfs
   
    !nogood
end

"""
True if all characters in s are puncutation.
   
$(SIGNATURES)      
"""
function isPunctuation(s::AbstractString)
    chlist = split(s,"")
    puncts = punctuation()
    tfs = map(c -> occursin(c, puncts), chlist)
    nogood = false in tfs
   
    !nogood
end

"""
Alphabetically sort a list of words in Unicode Greek.

$(SIGNATURES)
"""
function sortWords(words, ortho::LiteraryGreekOrthography)
    strippedpairs = map(wd -> ( lowercase(Unicode.normalize(wd, stripmark=true)), wd),words)
	sorted = sort(strippedpairs)
	map(pr -> pr[2], sorted)
end


"""
Create correct OrthographicToken for a given string.

$(SIGNATURES)    
"""
function tokenforstring(s::AbstractString)
    normed = Unicode.normalize(s, :NFKC)
    if isAlphabetic(normed)
        OrthographicToken(normed, LexicalToken())
    elseif isPunctuation(normed)
        OrthographicToken(normed, PunctuationToken())
    else
        OrthographicToken(normed, Orthography.UnanalyzedToken())
    end
end



"""
Split off any trailing punctuation and return an Array of leading string + trailing punctuation.

$(SIGNATURES)  
"""
function splitPunctuation(s::AbstractString)
    punct = Orthography.collecttail(s, PolytonicGreek.punctuation())
    trimmed = Orthography.trimtail(s, PolytonicGreek.punctuation())
    filter(s -> ! isempty(s), [trimmed, punct])
end

"""
Tokenize a string in standard literary Greek orthography.

$(SIGNATURES)  
"""
function tokenizeLiteraryGreek(s::AbstractString)
    wsdelimited = split(s)
    depunctuated = map(s -> splitPunctuation(s), wsdelimited)
    tknstrings = collect(Iterators.flatten(depunctuated))
    tkns = map(t -> tokenforstring(t), tknstrings)
end