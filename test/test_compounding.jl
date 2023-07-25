


@testset "Test breathings when catting morphemes in compounds" begin
    ortho = literaryGreek()

    s1 = "ἀπ#ἰεναι" # -> ἀπιέναι
    @test strcat(PolytonicGreek.splitmorphemes(s1)..., ortho) == "ἀπιεναι"

    s2 = "ἀπο#οἰσω" # -> ἀποίσω
    @test strcat(PolytonicGreek.splitmorphemes(s2)..., ortho) == "ἀποισω"

    s3 = "ἀπο#ἱημι" # -> ἀφίημι
    @test strcat(PolytonicGreek.splitmorphemes(s3)..., ortho) == "ἀφιημι"

    s4 = "παρα#ἀγγελλω" # -> παραγγελλω
    @test strcat(PolytonicGreek.splitmorphemes(s4)..., ortho) == "παραγγελλω"

    s5 = "μετα#ελθειν" # -> μετελθειν
    @test strcat(PolytonicGreek.splitmorphemes(s5)..., ortho) == "μετελθειν"

    s6 = "ἐπι#ἐθυμουν" # -> ἐπεθυμουν
    @test strcat(PolytonicGreek.splitmorphemes(s6)..., ortho) == "ἐπεθυμουν"

    s7 = "ἀντ#αἰρ" # -> ἀνταιρ
    @test strcat(PolytonicGreek.splitmorphemes(s7)..., ortho) == "ἀνταιρ"

    s8 = "ἀντ#αἱρ" # -> ἀνθαιρ
    @test strcat(PolytonicGreek.splitmorphemes(s8)..., ortho) == "ἀνθαιρ"


    @test strcat("ἀπο", "ἱκνεομαι", ortho) == "ἀφικνεομαι"
    
end



