
@testset "Test reduplication" begin
    lg = literaryGreek()
    @test reduplicate("γνωρι",lg) == nfkc("ἐγνωρι")
    @test reduplicate("γλυφ",lg) == nfkc("ἐγλυφ")

    @test reduplicate("κτι",lg) == nfkc("ἐκτι")
    @test reduplicate("στρατηγ",lg) == nfkc("ἐστρατηγ")
    @test reduplicate("ψαυ",lg) == nfkc("ἐψαυ")
    @test reduplicate("ζητ",lg) == nfkc("ἐζητ")

    @test reduplicate(nfkc("ῥυτιδ"),lg) == nfkc("ἐρρυτιδ")


    @test reduplicate("φονευ",lg) == "πεφονευ"
    @test reduplicate("θυ",lg) == "τεθυ"
    @test reduplicate("χορευ",lg) == "κεχωρευ"

    @test reduplicate("λυ",lg) == "λελυ"
    @test reduplicate("γραφ",lg) == "γεγραφ"
    @test reduplicate("κλι",lg) == "κεκλι"


    @test reduplicate(nfkc("ὀρθ"),lg) == nfkc("ὠρθ")
    @test reduplicate(nfkc("ἀγγελ"),lg) == nfkc("ἠγγελ")
end