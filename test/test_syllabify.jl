@testset "Test syllabification" begin
    @test syllabify("λίμνη") == ["λι", "μνη"]
    @test syllabify("ἔργμα") == ["ἐρ", "γμα"]
    @test syllabify("ποῖος") == ["ποι", "ος"]
    @test syllabify("ὀΐω") == ["ὀ", "ϊ", "ω" ]
    @test syllabify("ὀίω") == ["ὀ", "ϊ", "ω" ]
    @test syllabify("αἴει") == ["αἰ"    ,"ει"]

    longs = """
περὶ πολλοῦ ἂν ποιησαίμην, ὦ ἄνδρες, 
τὸ τοιούτους ὑμᾶς ἐμοὶ δικαστὰς περὶ τούτου τοῦ πράγματος γενέσθαι, 
οἷοίπερ ἂν ὑμῖν αὐτοῖς εἴητε τοιαῦτα πεπονθότες: 
εὖ γὰρ οἶδ' ὅτι, 
εἰ τὴν αὐτὴν γνώμην περὶ τῶν ἄλλων ἔχοιτε, 
ἥνπερ περὶ ὑμῶν αὐτῶν, οὐκ ἂν εἴη: 
ὅστις οὐκ ἐπὶ τοῖς γεγενημένοις ἀγανακτοίη, 
ἀλλὰ πάντες ἂν περὶ τῶν τὰ τοιαῦτα ἐπιτηδευόντων 
τὰς ζημίας μικρὰς ἡγοῖσθε.
#=

def testMap = [


"pwu+" : "pw#u+",


"a)nqos" : "a)n#qos",
"e)lpis" : "e)l#pis",

"a)ei" : "a)#ei",
"dia" : "di#a",
"die" : "di#e",
"eu)+" : "e#u)+",
"r(ea" : "r(e#a",
"pragma" : "pra#gma",
"sui+" : "su#i+",
"tiw" :  "ti#w",
"r(a" : "r(a",
"oi(o" : "oi(#o",
"a)asamhn": "a)#a#sa#mhn",
"e)u+" : "e)#u+",
"ou(tos" : "ou(#tos",
"dw|h" : "dw|#h",
"eu+n" : "e#u+n",
"a)ll'": "a)ll'",
"a)mf'" : "a)mf'",
"e)aa|" : "e)#a#a|",
"h)u+s" : "h)#u+s",
"h)i+e" : "h)#i+#e",
"kien" : "ki#en",
"kion" : "ki#on",
"ui(ei+" : "ui(#e#i+",
"xiwn"  : "xi#wn",
"a)u+th" : "a)#u+#th",
"lu_e" : "lu_#e",
"a)nalu_w": "a)#na#lu_#w",
"is" : "is",
"ios" : "i#os",
"ni_ke": "ni_#ke",
"e)gegra^pto" : "e)#ge#gra^#pto"
]
=#
end