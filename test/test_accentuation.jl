
@testset "Test stripping accents" begin
    s = "πολλά"
    expected = "πολλα"
    @test rmaccents(s) == expected
end

@test "Test adding accents" begin
    
end