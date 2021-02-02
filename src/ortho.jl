

"An orthographic system for encoding the Lycian alphabet primarily using ASCII characaters."
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

function tokenizeLiteraryGreek(s::AbstractString)
    wsdelimited = split(s)
    tkns = map(t -> tokenforstring(t), wsdelimited)
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
    '\u1fc5':'\u1fcc';
    '\u1fd2':'\u1fd3'; '\u1fd6':'\u1fdc';
    '\u1fe2':'\u1fe7';
    '\u1fea':'\u1fec';
    '\uf1f2':'\u1ff4'; '\u1ff6':'\u1ffc'
    ]
    join(ranges,"")
end

"Create correct `OrthographicToken` for a given string."
function tokenforstring(s::AbstractString)
    normed = Unicode.normalize(test1, :NFKC)
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
    tfs = map(c -> occursin(c, alphas), chlist)
    nogood = false in tfs
   
    !nogood
end

#=
"Tokenize Lycian text."
function tokenizeLycian(s::AbstractString)
    wsdelimited = split(s)
    morphemes = map(s -> split(s,"="), wsdelimited)
    tknstrings = collect(Iterators.flatten(morphemes))
    tkns = map(t -> tokenforstring(t), tknstrings)
end


"True if all characters in s are numeric"
function isNumeric(s::AbstractString)
    chlist = split(s,"")
    numlist = "15"
    tfs = map(c -> occursin(c, numlist), chlist)
    nogood = false in tfs
    !nogood
end




"True if s is the interpunctuation mark."
function isPunctuation(s::AbstractString)::Bool
    s == ":"
end



"TBA.  Convert ASCII encoding to Lycian Unicode range"
function ucode(s::AbstractString)
    unicodeDictionary = a2uDict()
    chlist = split(s, "")
    lycianCPs = map(c -> unicodeDictionary[only(c)], chlist)
    join(lycianCPs, "")
end


"Compose a map of ASCIIish characters to Lycian unicode code points."
function a2uDict()
    Dict(
        'a' => "𐊀",
        'e' => "𐊁",
        'b' => "𐊂",
        'B' => "𐊃",
        'g' => "𐊄",
        'd' => "𐊅",
        'i' => "𐊆",
        'w' => "𐊇",
        'z' => "𐊈",
        'Θ' => "𐊉",
        'y' => "𐊊",
        'k' => "𐊋",
        'q' => "𐊌",
        'l' => "𐊍",
        'm' => "𐊎",
        'n' => "𐊏",
        'M' => "𐊐",
        'N' => "𐊑",
        'o' => "𐊒",
        'p' => "𐊓",
        'K' => "𐊔",
        'r' => "𐊕",
        's' => "𐊖",
        't' => "𐊗",
        'T' => "𐊘",
        'A' => "𐊙",
        'E' => "𐊚",
        'h' => "𐊛",
        'x' => "𐊜",
        ':' => ":",
        ' ' => " "
    )
end
=#