
@testset "Test specified and default orhographies for emoving accents" begin
    lg = literaryGreek()
    expected = nfkc("πολλα")
    @test rmaccents("πολλά", ortho = lg) == expected
    @test rmaccents("πολλά") == expected
end

@testset "Test syllable quantity" begin
    lg = literaryGreek()
    @test PolytonicGreek.longsyllable("οὖν", ortho = lg)
end