@testset "Test edge cases found quarrying LSJ for Kanones" begin
    o = literaryGreek()
  
    @test syllabify(nfkc("ἁλμευσασθε"),o ) == [ "ἁλ","μευ","σα","σθε"]
    @test syllabify("ὐυζω",o) == ["ὐ","υ","ζω"]
    @test syllabify("ἐμπεριι_σχανον",o) == ["ἐμ", "πε","ρι","ι_","σχα","νον"]
    @test syllabify("ἰυζω",o) == ["ἰ", "υ", "ζω"]
    @test accentword("ὑ_γρορρητο", :RECESSIVE, o) == "ὑ_γρόρρητο"
    @test accentword("Βακχευσας", :RECESSIVE, o) == "Βάκχευσας"


end