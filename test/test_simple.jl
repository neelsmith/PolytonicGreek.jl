

@testset "Test simple categories in literary Greek" begin
    lg = literaryGreek()
    @test occursin("β", lg.consonants())
    @test occursin("α", lg.consonants()) == false

    @test occursin(  "α", lg.vowels())
    @test occursin( "ἁ", lg.vowels())
    @test occursin( "ἀ", lg.vowels())
    @test occursin( "ᾳ", lg.vowels())
    @test occursin( "β", lg.vowels()) == false
end

