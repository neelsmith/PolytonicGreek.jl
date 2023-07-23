@testset "Test accentuation of compounds" begin
    # Accent cannot precede augment.
    # So we have to KNOW that this is an augmented form!
    s1 = "ἀπ#ην" # -> ἀπῆν
    # "εἰσ#ηλθον" "ἀφ#ι_κται"
    # Accent cannot recede beyond last syllable of last prefix
    s2 = "περι#θες" # -> περίθες
    s3 = "συν#εκ#δος" # -> συνέκδος 
    # Accent on 2nd aor imptv retains accent with monosyllabic prefix
    s4 = "προ#δου" #->  # προδο
    # But recedes with polysyllabic prefix
    s5 = "ἀπο#δου" # -> ἀπόδου
    # Compound optatives retain accent of simplex.
    # So we have to KNOW that this is an optative.
    s6 = "ἀπο#δοιτο" # -> ἀποδοῖτο
    # Compound subjunctives are treated both ways in MSS
    s7 = "ἐπι#θηται" # ->  Both ἐπίθηται and ἐπιθῆται  are found



    s8 = "ἀνα#βητε" # -> ἀνάβητε
end


@testset "Test breathings when catting morphemes in compounds" begin
    ortho = literaryGreek()

    s1 = "ἀπ#ἰεναι" # -> ἀπιέναι
    @test strcat(PolytonicGreek.splitmorphemes(s1)..., ortho) == "ἀπιεναι"

    s2 = "ἀπο#οἰσω" # -> ἀποίσω
    @test_broken strcat(PolytonicGreek.splitmorphemes(s2)..., ortho) == "ἀποισω"

    s3 = "ἀπο#ἱημι" # -> ἀφίημι
    @test_broken strcat(PolytonicGreek.splitmorphemes(s3)..., ortho) == "ἀφιημι"

    s4 = "παρα#ἀγγελλω" # -> παραγγελλω
    @test_broken strcat(PolytonicGreek.splitmorphemes(s4)..., ortho) == "παραγγελλω"

    s5 = "μετα#ελθειν" # -> μετελθειν
    @test_broken strcat(PolytonicGreek.splitmorphemes(s5)..., ortho) == "μετελθειν"

    s6 = "ἐπι#ἐθυμουν" # -> ἐπεθυμουν
    @test_broken strcat(PolytonicGreek.splitmorphemes(s6)..., ortho) == "ἐπεθυμουν"

    s7 = "ἀντ#αἰρ" # -> ἀνταιρ
    @test strcat(PolytonicGreek.splitmorphemes(s7)..., ortho) == "ἀνταιρ"

    s8 = "ἀντ#αἱρ" # -> ἀνθαιρ
    @test_broken strcat(PolytonicGreek.splitmorphemes(s7)..., ortho) == "ἀνθαιρ"


    @test_broken strcat("ἀπο", "ἱκνεομαι", ortho) == "ἀφικνεομαι"
    
end



