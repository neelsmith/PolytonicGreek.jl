@testset "Test splitting on morpheme boundary" begin
    morph = nfkc("εἰσ#ῄα") |> rmaccents
    divided = PolytonicGreek.splitmorphemes(morph)
    @test divided == "εἰσ ῃα"
end


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
    divided = PolytonicGreek.splitdoubleconsonants(doubled)
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
    # This is OK:
    # we need a second pass to get full syllabification
    @test divided == "οὐ δεπο τε" 

    diph = Unicode.normalize("εἰσῄα", :NFKC) |> rmaccents
    divideddiph = PolytonicGreek.splitvcv(diph)
    #@test divideddiph == []


    divs = syllabify(nfkc("ἔχοιτο"))
    @test length(divs) == 3
end




@testset "Test syllabification" begin
    @test syllabify("προΐστημι")== ["προ","ϊ","στη","μι"]
    @test syllabify("ἀναμιμνησκόμενος") == ["ἀ","να","μι","μνη","σκο","με","νος"]
    @test syllabify("ἄνδρασι") == ["ἀν","δρα","σι"]
    @test syllabify("κελεύει") == ["κε","λευ","ει"]
    @test syllabify("οἰκίαις") == ["οἰ","κι", "αις"]
    @test syllabify("δέομαι") == ["δε","ο","μαι"]
    @test syllabify("θύειν") == ["θυ","ειν"]
    @test syllabify("καταβάλλω") == ["κα","τα","βαλ","λω"]
    @test syllabify("οὐδέποτε") == ["οὐ","δε","πο","τε"]
    @test syllabify("ποιησαίμην") == ["ποι","η","σαι","μην"]
    @test syllabify("ἔργμα") == ["ἐρ", "γμα"]
    @test syllabify("ποῖος") == ["ποι", "ος"]
    @test syllabify("αἴει") == ["αἰ","ει"]
    @test syllabify("ὀίω") == ["ὀι", "ω" ]
    @test syllabify("#γνώμην") == ["γνω", "μην"]
    @test syllabify("δεδιέναι") == ["δε","δι","ε","ναι"]
    @test syllabify("ὀΐω") == ["ὀ", "ϊ", "ω" ]
    @test syllabify("ἑωρακυῖα") == ["ἑ", "ω", "ρα", "κυι", "α"]

    @test syllabify("τόρνους") == ["τορ", "νους"]
end

@testset "Support addition of morphological boundary markers in syllabification" begin
    @test syllabify("εἰσ#ῄα") == ["εἰσ","ῃ","α"]
    @test syllabify("κατ#αισχύνουσι") == [ "κατ", "αι","σχυ","νου","σι"]
end

@testset "Test syllabification of continuous passage" begin
    psg = """
περὶ πολλοῦ ἂν ποιησαίμην, ὦ ἄνδρες, τὸ τοιούτους ὑμᾶς ἐμοὶ δικαστὰς περὶ τούτου τοῦ πράγματος γενέσθαι, 
οἷοίπερ ἂν ὑμῖν αὐτοῖς εἴητε τοιαῦτα πεπονθότες: εὖ γὰρ οἶδ' ὅτι, 
εἰ τὴν αὐτὴν γνώμην περὶ τῶν ἄλλων ἔχοιτε, ἥνπερ περὶ ὑμῶν αὐτῶν, οὐκ ἂν εἴη: 
ὅστις οὐκ ἐπὶ τοῖς γεγενημένοις ἀγανακτοίη, ἀλλὰ πάντες ἂν περὶ τῶν τὰ τοιαῦτα ἐπιτηδευόντων 
τὰς ζημίας μικρὰς ἡγοῖσθε.
"""
    syllables = join(syllabify(psg), " ")
    expected = "πε ρι πολ λου ἀν ποι η σαι μην, ὠ ἀν δρες, το τοι ου τους ὑ μας ἐ μοι δι κα στας πε ρι του του του πρα γμα τος γε νε σθαι, οἱ οι περ ἀν ὑ μιν αὐ τοις εἰ η τε τοι αυ τα πε πον θο τες: εὐ γαρ οἱ δ' ὁ τι, εἰ την αὐ την γνω μην πε ρι των ἀλ λων ἐ χοι τε, ἡν περ πε ρι ὑ μων αὐ των, οὐκ ἀν εἰ η: ὁ στις οὐκ ἐ πι τοις γε γε νη με νοις ἀ γα να κτοι η, ἀλ λα παν τες ἀν πε ρι των τα τοι αυ τα ἐ πι τη δευ ον των τας ζη μι ας μι κρας ἡ γοι σθε."
    @test syllables == expected
    #=@warn("ACTUAL VLAUE:")
    @warn(syllables)
    @warn("EXPETED:")
    @warn(expected)
    @warn("DIFF")
    @warn(diff(syllables, expected))=#
end


@testset "Test syllabification with explicit orthography" begin
    lg = literaryGreek()
    @test syllabify("κατ#αισχύνουσι", lg) == [ "κατ", "αι","σχυ","νου","σι"]
end


  
  

