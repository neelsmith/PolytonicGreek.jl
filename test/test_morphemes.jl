@testset "Test honoring of morpheme boundaries" begin
    ortho = literaryGreek()

    a1 = augment("ἐν#κελευε", ortho)
    @test a1 == nfkc("ἐνεκελευε")

    a2 = augment("ἐν#αγγελλε", ortho)
    @test a2 == nfkc("ἐνηγγελλε")

    a3 = augment("κελευε", ortho)
    @test a3 == nfkc("ἐκελευε")
end