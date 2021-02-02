using Greek
using Test
using Orthography


@testset "Test recognizing alphabet characters" begin
    s = "μῆνιν"
    @test Greek.isAlphabetic(s)
end

@testset "Test recognizing punctuation" begin
    punct = ";"
    @test Greek.isPunctuation(punct)
end

@testset "Test splitting strings into lexical and puncutation substrings" begin
    s1 = "θεά,"
    parts = Greek.splitPunctuation(s1)
    @test length(parts) == 2
    @test parts[2] == ","
    @test parts[1] == "θεά"
    s2 = "θεά"
    @test length(Greek.splitPunctuation(s2)) == 1
    s3 = ";"
    #@test length(Greek.splitPunctuation(s3)) == 1
end

@testset "Test tokenization of literary Greek" begin
    s = "Μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος,"
    tkns = tokenizeLiteraryGreek(s)
    @test length(tkns) == 8
    @test tkns[end] == OrthographicToken(",", PunctuationToken())
end