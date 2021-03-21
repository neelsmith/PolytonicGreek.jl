
@testset "Test stripping accents" begin
    s = "πολλά"
    expected = "πολλα"
    @test rmaccents(s) == expected
end

@testset "Test adding acute accents to vowels" begin
    @test addacute("α") == ""
    @test addacute("αυ") == ""
    @test addacute("ᾀ") == ""
    @test addacute("ϊ") == ""
end


@testset "Test adding circumflex accents to vowels" begin
end


@testset "Test adding accents to syllables" begin
end

@testset "Test adding accents to words" begin
end