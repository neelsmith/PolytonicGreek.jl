@testset "Test removing breathings" begin
    ortho = literaryGreek()
    @test rmbreathing(nfkc("αἴρω"),ortho) == nfkc("αίρω")
    @test rmbreathing(nfkc("εἷλον"),ortho) == nfkc("εῖλον")
    @test rmbreathing(nfkc("ὁ"),ortho) == nfkc("ο")
    @test rmbreathing(nfkc("ἐν"),ortho) == nfkc("εν")
end


@testset "Test adding breathings" begin
    # Develop unit tests...
end

@testset "Test detecting breathings" begin
    @test PolytonicGreek.lginitialrough(nfkc("αἴρω")) == false
    @test PolytonicGreek.lginitialsmooth(nfkc("αἴρω"))


    @test PolytonicGreek.lginitialrough(nfkc("αἱρέω"))

    @test PolytonicGreek.lginitialrough(nfkc("εἷλον")) 
    @test PolytonicGreek.lginitialsmooth(nfkc("εἷλον")) == false

    @test PolytonicGreek.lginitialrough(nfkc("πόλις")) == false
    @test PolytonicGreek.lginitialsmooth(nfkc("πόλις")) == false

    ortho = literaryGreek()
    @test rough("ἰεναι", ortho) == false
end