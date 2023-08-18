


@testset "Test breathings when catting morphemes in compounds" begin
    ortho = literaryGreek()

    s1 = "ἀπ#ἰεναι" # -> ἀπιέναι
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s1)...; elision = true) == nfkc("ἀπιεναι")

    s2 = "ἀπο#οἰσω" # -> ἀποίσω
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s2)...; elision = true) == "ἀποισω"

    s3 = "ἀπο#ἱημι" # -> ἀφίημι
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s3)...; elision = true) == "ἀφιημι"

    s4 = "παρα#ἀγγελλω" # -> παραγγελλω
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s4)...; elision = true) == "παραγγελλω"

    s5 = "μετα#ελθειν" # -> μετελθειν
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s5)...; elision = true) == "μετελθειν"

    s6 = "ἐπι#ἐθυμουν" # -> ἐπεθυμουν
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s6)...; elision = true) == "ἐπεθυμουν"

    s7 = "ἀντ#αἰρ" # -> ἀνταιρ
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s7)...; elision = true) == "ἀνταιρ"

    s8 = "ἀντ#αἱρ" # -> ἀνθαιρ
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s8)...; elision = true) == "ἀνθαιρ"


    @test strcat(ortho, "ἀπο", "ἱκνεομαι"; elision = true) == "ἀφικνεομαι"
    
end



