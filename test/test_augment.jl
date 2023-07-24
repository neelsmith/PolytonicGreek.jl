
@testset "Test augment" begin
    lg = literaryGreek()


    @test augment("κελευε", lg) == nfkc("ἐκελευε")
    @test augment("ῥυε", lg) == nfkc("ἐρρυε")

    @test augment("αἱρει", lg) == nfkc("ᾑρει")
    @test augment("εἰκαζε", lg) == nfkc("ᾐκαζε")
    @test augment("οἰκει", lg) == nfkc("ᾠκει")
    @test augment("αὐλησε", lg) == nfkc("ηὐλησε")
    @test augment("εὐχετο", lg) == nfkc("ηὐχετο")

    @test augment("ἀκουσε", lg) == nfkc("ἠκουσε")
    @test augment("ἐλπιζε", lg) == nfkc("ἠλπιζε")
    @test augment("ὁριζε", lg) == nfkc("ὡριζε")

    @test augment("ἱκετευε", lg) == nfkc("ἱ_κετευε")
    @test augment("ὑβριζε", lg) == nfkc("ὑ_βριζε")


    @test augment_initial(lg) == nfkc("ἐ")
    @test augment_medial(lg) == "ε"
   
    @test augment(nfkc("ἐκ#φερε"), lg) == nfkc("ἐξ#εφερε")
end