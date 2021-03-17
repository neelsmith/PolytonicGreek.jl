@testset "Test syllabification" begin
    @test syllabify("λίμνη") == ["λί", "μνη"]
end