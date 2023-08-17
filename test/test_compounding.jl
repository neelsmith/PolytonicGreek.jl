


@testset "Test breathings when catting morphemes in compounds" begin
    ortho = literaryGreek()

    s1 = "ἀπ#ἰεναι" # -> ἀπιέναι
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s1)...) == nfkc("ἀπιεναι")

    s2 = "ἀπο#οἰσω" # -> ἀποίσω
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s2)...) == "ἀποισω"

    s3 = "ἀπο#ἱημι" # -> ἀφίημι
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s3)...) == "ἀφιημι"

    s4 = "παρα#ἀγγελλω" # -> παραγγελλω
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s4)...) == "παραγγελλω"

    s5 = "μετα#ελθειν" # -> μετελθειν
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s5)...) == "μετελθειν"

    s6 = "ἐπι#ἐθυμουν" # -> ἐπεθυμουν
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s6)...) == "ἐπεθυμουν"

    s7 = "ἀντ#αἰρ" # -> ἀνταιρ
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s7)...) == "ἀνταιρ"

    s8 = "ἀντ#αἱρ" # -> ἀνθαιρ
    @test strcat(ortho, PolytonicGreek.splitmorphemes(s8)...) == "ἀνθαιρ"


    @test strcat(ortho, "ἀπο", "ἱκνεομαι") == "ἀφικνεομαι"
    
end



