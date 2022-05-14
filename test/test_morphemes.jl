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

    a1 = reduplicate("ἐν#κελευκε", ortho)
    @test a1 == nfkc("ἐγκεκελευκε")

    a2 = augment("ἐν#αγγελκε", ortho)
    @test a2 == nfkc("ἐνηγγελκε")

    a3 = augment("κελευκε", ortho)
    @test a3 == nfkc("ἐκεκελευκε")
end