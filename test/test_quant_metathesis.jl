@testset "Test adding accents to words" begin
    lg = literaryGreek()
    @test accentword("ἀνθρωπος", :RECESSIVE, lg) == "ἄνθρωπος"
end