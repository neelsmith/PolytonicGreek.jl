@testset "Test removing breathings" begin
    ortho = literaryGreek()
    @test rmbreathing(nfkc("αἴρω"),ortho) == nfkc("αίρω")
    @test rmbreathing(nfkc("εἷλον"),ortho) == nfkc("εῖλον")
    @test rmbreathing(nfkc("ὁ"),ortho) == nfkc("ο")
    @test rmbreathing(nfkc("ἐν"),ortho) == nfkc("εν")

end