
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
    @test PolytonicGreek.accentsyllable("ἄνθρωπος") == "ἀν"
    @test PolytonicGreek.penult("ἄνθρωπος") ==  "θρω"
end

@testset "Test adding accent to specified syllable of word" begin
    @test accentpenult("γνωμη", :ACUTE) == "γνώμη"
    @test accentultima("γνωμων", :CIRCUMFLEX) == "γνωμῶν"
    @test accentantepenult("ἐκελευον") == "ἐκέλευον"
end