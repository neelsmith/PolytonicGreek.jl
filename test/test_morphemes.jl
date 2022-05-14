@testset "Test honoring morpheme boundaries in augment" begin
    ortho = literaryGreek()

    a1 = augment("ἐν#κελευε", ortho)
    @test a1 == nfkc("ἐνεκελευε")

    a2 = augment("ἐν#αγγελλε", ortho)
    @test a2 == nfkc("ἐνηγγελλε")

    a3 = augment("κελευε", ortho)
    @test a3 == nfkc("ἐκελευε")
end


@testset "Test honoring morpheme boundaries in reduplication" begin
    ortho = literaryGreek()

    r1 = reduplicate("ἐν#κελευκε", ortho)
    @test r1 == nfkc("ἐγκεκελευκε")

    r2 = reduplicate("ἐν#αγγελκε", ortho)
    @test r2 == nfkc("ἐνηγγελκε")

    r3 = reduplicate("κελευκε", ortho)
    @test r3 == nfkc("κεκελευκε")
end