
@testset "Test augment" begin
    lg = literaryGreek()
    @test  augment(lg) == nfkc("ἐ")
    @test augment(lg; s = "κελευε") == nfkc("ἐκελευε")
    @test augment(lg; s = "ῥυε") == nfkc("ἐρρυε")

    @test_broken augment(lg; s = "ἀκουσε") == nfkc("ἠκουσε")
    @test_broken augment(lg; s = "αἱρει") == nfkc("ᾑρει")
    @test_broken augment(lg; s = "εἰκαζε") == nfkc("ᾐκαζε")
    @test_broken augment(lg; s = "οἰκει") == nfkc("ᾠκει")
    @test_broken augment(lg; s = "ἐλπιζε") == nfkc("ἠλπιζε")
    @test_broken augment(lg; s = "ἱκετευε") == nfkc("ἱ_κετευε")
    @test_broken augment(lg; s = "ὁριζε") == nfkc("ὡριζε")
    @test_broken augment(lg; s = "ὑβριζε") == nfkc("ὑ_βριζε")
    @test_broken augment(lg; s = "αὐλησε") == nfkc("ηὐλησε")
    @test_broken augment(lg; s = "εὐχετο") == nfkc("ηὐχετο")
    
end