
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
    res = PolytonicGreek.sortWords(split(s," "), literaryGreek())
    @test res == ["ἄειδε,", "Ἀχιλῆος,", "θεά,", "Μῆνιν", "Πηληϊάδεω"]
end

@testset "Test orthographic validation" begin
    s1 ="Μῆνιν ἄειδε θεὰ Πηληϊάδεω Ἀχιλῆος"    
    s2 = "οὐλομένην· ἡ μυρί' Ἀχαιοῖς ἄλγε' ἔθηκεν"
    ortho = literaryGreek()
    
    @test validstring(s1, ortho )
    @test validstring(s2, ortho ) == false
    tkns = tokenizeLiteraryGreek(s2)
    # High stop is wrong, rest is OK.
    @test validstring(tkns[1].text, ortho) == false
    for i in 2:length(tkns)
        @test validstring(tkns[i].text, ortho)
    end

    s3 = "κόσμηθεν ἅμ ̓ ἡγεμόνεσσιν"

    s3tkns = tokenizeLiteraryGreek(s3)

    for t in s3tkns
        println(t.text, " Valid? ", validstring(t.text, ortho))
    end
    # Curly quote is wrong, rest is OK.
    #@test validstring(ortho, s3tkns[1].text)
    #@test validstring(ortho, s3tkns[2].text) == false
    #@test validstring(ortho, s3tkns[3].text) == false
    
end
