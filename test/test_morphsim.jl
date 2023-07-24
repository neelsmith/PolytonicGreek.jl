@testset "Simulate phonology used in morphological generation" begin
    o = literaryGreek()

    ex1 = strcat("λυ", "ει", o)
    @test ex1 ==  "λυει"
    @test accentword(ex1,:RECESSIVE, o) == "λύει"

    dupe = reduplicate("λυ", o)
    @test dupe ==  "λελυ"
    @test accentword(strcat(dupe, "κε", o), :RECESSIVE, o) ==  "λέλυκε"

    aug = augment("λυ", o)
    @test aug == "ἐλυ"
    @test accentword(strcat(aug, "ομεθα",o), :RECESSIVE, o) ==  "ἐλυόμεθα"

    ex2 = strcat("ἀνα#λυ", "ει", o)
    @test ex2 == "ἀνα#λυει"
    @test accentword(ex2,:RECESSIVE, o) == "ἀναλύει"

    dupe2 = reduplicate("ἀνα#λυ", o)
    @test dupe2 ==  "ἀνα#λελυ"
    @test accentword(strcat(dupe2, "κε", o), :RECESSIVE, o) ==  "ἀναλέλυκε"

    aug2 = augment("ἀνα#λυ", o)
    @test aug2 == "ἀν#ελυ"
    @test accentword(strcat(aug2, "ομεθα",o), :RECESSIVE, o) ==  "ἀνελυόμεθα"

end