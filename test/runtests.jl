using PolytonicGreek
using Test
using Orthography


@testset "Test recognizing alphabet characters" begin
    s = "μῆνιν"
    @test PolytonicGreek.isAlphabetic(s)
end

@testset "Test recognizing punctuation" begin
    punct = ";"
    @test PolytonicGreek.isPunctuation(punct)
end

@testset "Test splitting strings into lexical and puncutation substrings" begin
    s1 = "θεά,"
    parts = PolytonicGreek.splitPunctuation(s1)
    @test length(parts) == 2
    @test parts[2] == ","
    @test parts[1] == "θεά"
    s2 = "θεά"
    @test length(PolytonicGreek.splitPunctuation(s2)) == 1
    s3 = ";"
    #@test length(PolytonicGreek.splitPunctuation(s3)) == 1
end

@testset "Test tokenization of literary Greek" begin
    s = "Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"
    tkns = tokenizeLiteraryGreek(s)
    @test length(tkns) == 8
    @test tkns[end] == OrthographicToken(",", PunctuationToken())
end

@testset "Test sorting" begin
    s = "Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"
    res = PolytonicGreek.sortWords(split(s," "))
    @test res == ["ἄειδε,", "Ἀχιλῆος,", "θεά,", "Μῆνιν", "Πηληϊάδεω"]
end