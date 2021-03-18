@testset "Test syllabification" begin
    @test syllabify("λίμνη") == ["λί", "μνη"]
    @test syllabify("ἐργμα") == ["ἐρ", "γμα"]
end