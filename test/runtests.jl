using Greek
using Test
using Orthography


@testset "Test recognizing alphabet characters" begin
    s = "μῆνιν"
    @test Greek.isAlphabetic(s)
end