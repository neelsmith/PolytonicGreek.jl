
@testset "Test stripping accents" begin
    s = "πολλά"
    expected = "πολλα"
    @test rmaccent(s) == expected
end