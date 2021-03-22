
@testset "Test stripping accents" begin
    s = "πολλά"
    expected = "πολλα"
    @test rmaccents(s) == expected
end

@testset "Test adding acute accents to vowels" begin
    @test PolytonicGreek.addacute("α") == "ά"
    @test PolytonicGreek.addacute("αυ") == "αύ"
    @test PolytonicGreek.addacute("ᾀ") == "ᾄ"
    @test PolytonicGreek.addacute("ϊ") == "ΐ"
end


@testset "Test adding circumflex accents to vowels" begin
    @test PolytonicGreek.addcircumflex("α") == "ᾶ"
    @test PolytonicGreek.addcircumflex("αυ") == "αῦ"
    @test PolytonicGreek.addcircumflex("ᾀ") == "ᾆ"
    @test PolytonicGreek.addcircumflex("ϊ") == "ῗ"
end


@testset "Test adding accents to syllables" begin
    @test PolytonicGreek.accentsyllable("των", :CIRCUMFLEX) == "τῶν"
    @test PolytonicGreek.accentsyllable("τα", :ACUTE) == "τά"
    @test PolytonicGreek.accentsyllable("ᾀ", :ACUTE) == "ᾄ"
end

@testset "Test adding accents to words" begin
    @test accentword("ἀνθρωπος", :RECESSIVE) == "ἄνθρωπος"
    @test accentword("ἀνθρωπους", :RECESSIVE) == "ἀνθρώπους"
    @test accentword("δωρον", :PENULT) == "δῶρον"
    @test accentword("δωρῳ", :PENULT) == "δώρῳ"
end

@testset "Test extracting syllables from words" begin
    @test PolytonicGreek.antepenult("ἄνθρωπος") == "ἀν"
    @test PolytonicGreek.penult("ἄνθρωπος") ==  "θρω"
end

@testset "Test adding accent to specified syllable of word" begin
    @test accentpenult("γνωμη", :ACUTE) == "γνώμη"
    @test accentultima("γνωμων", :CIRCUMFLEX) == "γνωμῶν"
    @test accentantepenult("ἐκελευον") == "ἐκέλευον"
end

@testset "Test flipping grave to acute" begin
    @test PolytonicGreek.flipaccent("τὰ") == nfkc("τά")
    @test PolytonicGreek.flipaccent("τῶν") == nfkc("τῶν")
    @test PolytonicGreek.flipaccent("τά") == nfkc("τά")
end

@testset "Test stripping consonants" begin
    @test PolytonicGreek.vowelsonly("τῶν") == "ῶ"
end

@testset "Test counting accents" begin
    @test PolytonicGreek.countaccents("ό") == 1
    @test PolytonicGreek.countaccents("ἄνθρωπός") == 2
end

@testset "Test stripping enclitic" begin
    @test PolytonicGreek.stripenclitic("ἄνθρωπός") == "ἄνθρωπος"
end

@testset "Test normalizing word string to morphologically normal form" begin
    @test PolytonicGreek.tokenform("ἄνθρωπός") == "ἄνθρωπος"
    @test PolytonicGreek.tokenform("ὁδὸν") == "ὁδόν"
end
