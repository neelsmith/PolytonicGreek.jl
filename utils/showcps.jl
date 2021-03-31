
function showcps(s)
    println("As received:")
    for c in s
        println(c, " : ", codepoint(c), " : ",  string(codepoint(c),base=16), 
        " Valid? ", validstring(literaryGreek(), string(c)))
    end
    println("Normalized:")
    normed =  Unicode.normalize(s, :NFKC)
    for c in s
        println(c, " : ", codepoint(c), " : ",  string(codepoint(c),base=16), 
        " Valid? ", validstring(literaryGreek(), string(c)))
    end
end
