@testset "Test stripping explicit long mark" begin
    s = nfkc("γνώμα_ς")
    expected = nfkc("γνώμας")
    @test PolytonicGreek.stripquant(s) == expected
end

@testset "Test adding acute to long vowel" begin
    @test PolytonicGreek.addacute("α_") == nfkc("ά_")
end

# add circumflex
# flipaccent
# accentsyllables
# accentword