@testset "Test literary Greek implementation of Orthography functions" begin
    lg = literaryGreek()
    @test codepoints(lg) == lg.codepoints
    @test tokentypes(lg) == [Orthography.LexicalToken, Orthography.PunctuationToken]
end

@testset "Test generating alphabetic characters" begin
    alphas = PolytonicGreek.alphabetic()
    expectedcount = 267
    @test length(alphas) == expectedcount
end


@testset "Test generating puncutation characters" begin
    puncts = PolytonicGreek.punctuation()
    @test puncts == ".,;:"
end

@testset "Test recognizing alphabetic tokens" begin
    @test PolytonicGreek.isAlphabetic("μῆνιν")
end

@testset "Test recognizing punctuation tokens" begin
    @test PolytonicGreek.isPunctuation(":")
end

@testset "Test alphabetic sorting" begin
    wordlist = split("μῆνιν ἄειδε θεά")
    expected = ["ἄειδε", "θεά", "μῆνιν"]
    @test PolytonicGreek.sortWords(wordlist, literaryGreek()) == expected
end

@testset "Test creating token from string value" begin
    t = PolytonicGreek.tokenforstring("μῆνιν")
    typeof(t.tokencategory) == Orthography.LexicalToken
    t.text == "μῆνιν"
end

@testset "Test splitting punctuation from alphabetic" begin
    split = PolytonicGreek.splitPunctuation("ἄειδε,")
    @test length(split) == 2
    @test split[1] == "ἄειδε"
    @test split[2] == ","
end

@testset "Test tokenizing literary Greek" begin
    tokens = PolytonicGreek.tokenizeLiteraryGreek("μῆνιν ἄειδε,")
    @test length(tokens) == 3
    @test tokens[end].text == ","
end
