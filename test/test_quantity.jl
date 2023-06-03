@testset "Test stripping explicit long mark" begin
    s = nfkc("γνώμα_ς")
    expected = nfkc("γνώμας")
    @test PolytonicGreek.stripquant(s) == expected
end


@testset "Test removing accents from long syllables" begin
    lg = literaryGreek()
    @test rmaccents(nfkc("πᾶ_σι"), lg) == nfkc("πα_σι")
end

@testset "Test adding acute to long vowel" begin
    lg = literaryGreek()
    @test PolytonicGreek.addacute("α_", lg) == nfkc("ά_")
end


@testset "Test adding circumflex to long vowel" begin
    lg = literaryGreek()
    @test PolytonicGreek.addcircumflex("α_", lg) == nfkc("ᾶ_")
end

@testset "Test flipping barytone with long vowel" begin
    lg = literaryGreek()
    @test PolytonicGreek.flipaccent(nfkc("ὰ_"), lg) == nfkc("ά_")
end

@testset "Test adding accents to syllables with long vowels" begin
    lg = literaryGreek()
    @test PolytonicGreek.accentsyllable("τα_ν", :CIRCUMFLEX, lg) == "τᾶ_ν"
    @test PolytonicGreek.accentsyllable("τα_", :ACUTE, lg) == "τά_"
end

@testset "Test adding accents to words with long vowels" begin
    lg = literaryGreek()
    @test accentword("γνωμα_ς", :PENULT, lg) == nfkc("γνώμα_ς")
end


@testset "Test adding accents to words with explicitly short vowels " begin
    lg = literaryGreek()
    @test accentword("πολεω^ς", :RECESSIVE, lg) == nfkc("πόλεω^ς")
end


@testset "Test flipping accent on words with explicitly short vowels " begin
    lg = literaryGreek()
    @test  PolytonicGreek.flipaccent("πόλεω^ς", lg) == nfkc("πόλεω^ς")
end