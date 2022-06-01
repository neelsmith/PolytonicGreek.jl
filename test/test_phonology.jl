@testset "Test literary Greek phonological classes" begin
    ortho = literaryGreek()
    @test liquids(ortho) == ["λ","μ","ν","ρ"]
    @test dentals(ortho) == ["τ", "δ", "θ"]
    @test labials(ortho) == ["π", "β", "φ"]
    @test palatals(ortho) == ["κ", "γ", "χ"]

    allstops = stops(ortho)
    @test length(allstops) == 9
end