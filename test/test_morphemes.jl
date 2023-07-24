@testset "Test honoring morpheme boundaries in augment" begin
    ortho = literaryGreek()

    a1 = augment("ἐν#κελευε", ortho)
    @test a1 == nfkc("ἐν#εκελευε")

    a2 = augment("ἐν#αγγελλε", ortho)
    @test a2 == nfkc("ἐν#ηγγελλε")

    a3 = augment("κελευε", ortho)
    @test a3 == nfkc("ἐκελευε")
end


@testset "Test honoring morpheme boundaries in reduplication" begin
    ortho = literaryGreek()

    r1 = reduplicate("ἐν#κελευκε", ortho)
    @test r1 == nfkc("ἐν#κεκελευκε")

    r2 = reduplicate("ἐν#αγγελκε", ortho)
    @test r2 == nfkc("ἐν#ηγγελκε")

    r3 = reduplicate("κελευκε", ortho)
    @test r3 == nfkc("κεκελευκε")
end