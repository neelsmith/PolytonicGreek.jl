
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
    
end

@testset "Test adding accents to words" begin
end