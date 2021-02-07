

"An orthographic system for standard orthography of printed literary Greek."
struct LiteraryGreekOrthography <: OrthographicSystem
    codepoints
    tokencategories
    tokenizer
end

"Instantiate a LycianAscii with correct code points and token types."
function literaryGreek()
    cps = alphabetic() * " \t\n"
    ttypes = [
        Orthography.LexicalToken,
        Orthography.PunctuationToken
    ]
    LiteraryGreekOrthography(cps, ttypes, tokenizeLiteraryGreek)
end


"Split off any trailing punctuation and return an Array of leading strim + trailing punctuation."
function splitPunctuation(s::AbstractString)
    punct = Orthography.collecttail(s, PolytonicGreek.punctuation())
    trimmed = Orthography.trimtail(s, PolytonicGreek.punctuation())
    filter(s -> ! isempty(s), [trimmed, punct])
end

"Tokenize a string in standard literary Greek orthography."
function tokenizeLiteraryGreek(s::AbstractString)
    wsdelimited = split(s)
    depunctuated = map(s -> splitPunctuation(s), wsdelimited)
    tknstrings = collect(Iterators.flatten(depunctuated))
    tkns = map(t -> tokenforstring(t), tknstrings)
end


"Compose a string with all alphabetic characters."
function alphabetic()
    ranges = ['α':'ω'; 'Α':'Ρ' ; 'Σ':'Ω' ;
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
    '\uf1f2':'\u1ff4'; '\u1ff6':'\u1ffc'
    ]
    join(ranges,"")
end

"Compose a string with all alphabetic characters."
function punctuation()
    ".,;:"
end

"Create correct `OrthographicToken` for a given string."
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


"True if all characters in s are alphabetic."
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

"True if all characters in s are puncutation."
function isPunctuation(s::AbstractString)
    chlist = split(s,"")
    puncts = punctuation()
    tfs = map(c -> occursin(c, puncts), chlist)
    nogood = false in tfs
   
    !nogood
end
