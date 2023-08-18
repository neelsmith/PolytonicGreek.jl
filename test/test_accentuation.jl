
@testset "Test stripping accents with default orthography" begin
    s = "πολλά"
    expected = "πολλα"
    @test rmaccents(s) == expected
end

@testset "Test stripping accents with specified orthography" begin
    s = "πολλά"
    expected = "πολλα"
    lg = literaryGreek()
    @test rmaccents(s, lg) == expected
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
    @test PolytonicGreek.accentsyllable(nfkc("ῥα"), :ACUTE) == nfkc("ῥά")
end

@testset "Test adding accents to words" begin
    lg = literaryGreek()
    @test accentword("ἀνθρωπος", :RECESSIVE, lg) == "ἄνθρωπος"
    @test accentword("ἀνθρωπους", :RECESSIVE, lg) == "ἀνθρώπους"
    @test accentword("ἀνθρωποι", :RECESSIVE, lg) == nfkc("ἄνθρωποι")
    @test accentword("θεραπαιναι", :RECESSIVE,lg) == nfkc("θεράπαιναι")
    @test accentword("δωρον", :PENULT, lg) == "δῶρον"
    @test accentword("δωρῳ", :PENULT, lg) == "δώρῳ"
end

@testset "Test extracting syllables from words" begin
    lg = literaryGreek()
    @test PolytonicGreek.antepenult("ἄνθρωπος", lg) == "ἀν"
    @test PolytonicGreek.penult("ἄνθρωπος", lg) ==  "θρω"
end

@testset "Test adding accent to specified syllable of word" begin
    lg = literaryGreek()
    @test PolytonicGreek.accentpenult("γνωμη", :ACUTE, lg) == "γνώμη"
    @test PolytonicGreek.accentultima("γνωμων", :CIRCUMFLEX, lg) == "γνωμῶν"
    @test PolytonicGreek.accentantepenult("ἐκελευον", lg) == "ἐκέλευον"
end

@testset "Test flipping grave to acute" begin
    lg = literaryGreek()
    @test PolytonicGreek.flipaccent("τὰ", lg) == nfkc("τά")
    @test PolytonicGreek.flipaccent("τῶν", lg) == nfkc("τῶν")
    @test PolytonicGreek.flipaccent("τά", lg) == nfkc("τά")
end

@testset "Test stripping consonants" begin
    lg = literaryGreek()
    @test PolytonicGreek.vowelsonly("τῶν", lg) == "ῶ"
end

@testset "Test counting accents" begin
    lg = literaryGreek()
    @test PolytonicGreek.countaccents("ό", lg) == 1
    @test PolytonicGreek.countaccents("ἄνθρωπός", lg) == 2
end

@testset "Test stripping enclitic" begin
    lg = literaryGreek()
    @test PolytonicGreek.stripenclitic("ἄνθρωπός", lg) == "ἄνθρωπος"
end

@testset "Test normalizing word string to morphologically normal form" begin
    lg = literaryGreek()
    @test PolytonicGreek.tokenform("ἄνθρωπός", lg) == nfkc("ἄνθρωπος")
    @test PolytonicGreek.tokenform("ὁδὸν", lg) == nfkc("ὁδόν")
end


@testset "Test recognizing final οι/αι as short" begin
    lg = literaryGreek()
    @test PolytonicGreek.finallong("οι", lg) == false
    @test accentword("ἀνθρωποι", :RECESSIVE, lg) == nfkc("ἄνθρωποι")
    @test accentword("γνωμα_ς", :PENULT, lg) == nfkc("γνώμα_ς")
end

@testset "Test recognizing non-final οι/αι as long" begin
    lg = literaryGreek()
    @test PolytonicGreek.finallong("οις", lg) 
end


@testset "Test word accenting" begin
    lg = literaryGreek()
    @test accentword("ἐν#κελευω", :RECESSIVE, lg) == nfkc("ἐγκελεύω")
    @test accentword("νοηματος", :RECESSIVE, lg) == nfkc("νοήματος")
end