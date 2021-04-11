
@testset "Test incompletely implemented subtypes" begin
    struct LameOrthography <: GreekOrthography
        label
    end

    lame = LameOrthography("No functions implemented!")
    @test supertype(typeof(lame)) == GreekOrthography
    @test isnothing(vowels(lame))
end