

@testset "Test simple categories in literary Greek" begin
    lg = literaryGreek()
    @test occursin("β", consonants(lg))
    @test occursin("α", consonants(lg)) == false

    @test occursin(  "α", vowels(lg))
    @test occursin( "ἀ", vowels(lg))
    @test occursin( "ἁ", vowels(lg))
    @test occursin( "ᾳ", vowels(lg))
    @test occursin( "β", vowels(lg)) == false
end

