using Greek
using Test
using Orthography


@testset "Test recognizing alphabet characters" begin
    #s = "μῆνιν"
    s = "μ"
    @test Greek.isAlphabetic(s)
end