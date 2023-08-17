@testset "Simulate phonology used in morphological generation" begin
    o = literaryGreek()

    ex1 = strcat(o, "λυ", "ει")
    @test ex1 ==  "λυει"
    @test accentword(ex1,:RECESSIVE) == "λύει"

    dupe = reduplicate("λυ", o)
    @test dupe ==  "λελυ"
    @test accentword(strcat(o, dupe, "κε"), :RECESSIVE) ==  "λέλυκε"

    aug = augment("λυ", o)
    @test aug == "ἐλυ"
    @test accentword(strcat(o, aug, "ομεθα"), :RECESSIVE) ==  "ἐλυόμεθα"

    ex2 = strcat(o, "ἀνα#λυ", "ει")
    @test ex2 == "ἀνα#λυει"
    @test accentword(ex2,:RECESSIVE) == "ἀναλύει"

    dupe2 = reduplicate("ἀνα#λυ", o)
    @test dupe2 ==  "ἀνα#λελυ"
    @test accentword(strcat(o, dupe2, "κε"), :RECESSIVE) ==  "ἀναλέλυκε"

    aug2 = augment("ἀνα#λυ", o)
    @test aug2 == "ἀν#ελυ"
    @test accentword(strcat(o, aug2, "ομεθα"), :RECESSIVE) ==  "ἀνελυόμεθα"

end