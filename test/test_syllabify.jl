
@testset "Test splitting on diaeresis" begin
    diaeresis = Unicode.normalize("προΐστημι", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitdiaeresis(diaeresis)
    @test divided == "προ ϊστημι"
end

@testset "Test splitting on mu+nu" begin
    munu = Unicode.normalize("ἀναμιμνησκόμενος", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitmunu(munu)
    @test divided == "ἀναμι μνησκομενος"
end

@testset "Test splitting on liquid+consonant" begin
    liqcons = Unicode.normalize("ἄνδρασι", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitliqcons(liqcons)
    @test divided == "ἀν δρασι"
end

@testset "Test splitting on diphthong+vowel" begin
    dipvowel = Unicode.normalize("κελεύει", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitdiphthongvowel(dipvowel)
    @test divided == "κελευ ει"
end

@testset "Test splitting on vowel+diphthong" begin
    dipvowel = Unicode.normalize("οἰκίαις", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitvoweldiphthong(dipvowel)
    @test divided == "οἰκι αις"
end

@testset "Test splitting on short vowel followed by vowel" begin
    shortvowel = Unicode.normalize("δέομαι", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitshortvowelvowel(shortvowel)
    @test divided == "δε ομαι"
end

@testset "Test splitting on long vowel followed by vowel" begin
    longvowel = Unicode.normalize("εἰσῄα", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitlongvowelvowel(longvowel)
    @test divided == "εἰσῃ α"
end

@testset "Test splitting on upsilon followed by vowel" begin
    upsilonvowel = Unicode.normalize("θύειν", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitupsilonvowel(upsilonvowel)
    @test divided == "θυ ειν"
end

@testset "Test splitting on double consonant" begin
    doubled = Unicode.normalize("καταβάλλω", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitdoubleconsonant(doubled)
    @test divided == "καταβαλ λω"
end


@testset "Test splitting on consonant clusters" begin
    cluster = Unicode.normalize("καταισχύνουσι", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitconsonantcluster(cluster)
    @test divided == "καται σχυνουσι"
end

@testset "Test splitting VCV" begin
    vcv = Unicode.normalize("οὐδέποτε", :NFKC) |> rmaccents
    divided = PolytonicGreek.splitvcv(vcv)
    @test divided == "οὐ δεπο τε"
end


#οὐδέποτε
#καταβαλλω
# εωρακυια
#δεδιεναι
#=
@testset "Test syllabification" begin
    @test syllabify("ὀΐω") == ["ὀ", "ϊ", "ω" ]
    @test syllabify("λίμνη") == ["λι", "μνη"]
    @test syllabify("κελεύει") == ["κε", "λευ", "ει"]
    @test syllabify("οἰκίαις") == ["οἰ", "κι","αις"]
    @test syllabify("ποιησαίμην") == ["ποι","η","σαι","μην"]

    @test syllabify("ἀναμιμνησκόμενος") == []

    @test syllabify("ἔργμα") == ["ἐρ", "γμα"]
    @test syllabify("ποῖος") == ["ποι", "ος"]
    @test syllabify("ὀΐω") == ["ὀ", "ϊ", "ω" ]
    @test syllabify("ὀίω") == ["ὀ", "ϊ", "ω" ]
    @test syllabify("αἴει") == ["αἰ"    ,"ει"]
    s = "προΐστημι"
end
=#
#=
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
