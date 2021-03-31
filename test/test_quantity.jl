@testset "Test stripping explicit long mark" begin
    s = nfkc("γνώμα_ς")
    expected = nfkc("γνώμας")
    @test PolytonicGreek.stripquant(s) == expected
end

@testset "Test adding acute to long vowel" begin
    @test PolytonicGreek.addacute("α_") == nfkc("ά_")
end


@testset "Test adding circumflex to long vowel" begin
    @test PolytonicGreek.addcircumflex("α_") == nfkc("ᾶ_")
end


@testset "Test flipping barytone with long vowel" begin
    @test PolytonicGreek.flipaccent(nfkc("ὰ_")) == nfkc("ά_")
end
# flipaccent
# accentsyllables
# accentword