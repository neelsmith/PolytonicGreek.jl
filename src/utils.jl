
function showcps(s)
    for c in s
        println(c, " : ", codepoint(c), " : ",  string(codepoint(c),base=16))
    end
end