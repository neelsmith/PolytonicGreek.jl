
@testset "Test augment" begin
    lg = literaryGreek()

    @test  augment(lg) == nfkc("ἐ")

    @test augment(lg; s = "κελευε") == nfkc("ἐκελευε")
    @test augment(lg; s = "ῥυε") == nfkc("ἐρρυε")

    @test augment(lg; s = "αἱρει") == nfkc("ᾑρει")
    @test augment(lg; s = "εἰκαζε") == nfkc("ᾐκαζε")
    @test augment(lg; s = "οἰκει") == nfkc("ᾠκει")
    @test augment(lg; s = "αὐλησε") == nfkc("ηὐλησε")
    @test augment(lg; s = "εὐχετο") == nfkc("ηὐχετο")

    @test augment(lg; s = "ἀκουσε") == nfkc("ἠκουσε")
    @test augment(lg; s = "ἐλπιζε") == nfkc("ἠλπιζε")
    @test augment(lg; s = "ὁριζε") == nfkc("ὡριζε")

    @test augment(lg; s = "ἱκετευε") == nfkc("ἱ_κετευε")
    @test augment(lg; s = "ὑβριζε") == nfkc("ὑ_βριζε")

    @test augment(lg; s = "") == nfkc("ἐ")

    @test augment_initial(lg) == nfkc("ἐ")
    @test augment_medial(lg) == "ε"
   
    
end