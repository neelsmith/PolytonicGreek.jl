@testset "Test accentuation of compounds" begin
    # Accent cannot precede augment.
    # So we have to KNOW that this is an augmented form!
    s1 = "ἀπ#ην" # -> ἀπῆν
    # "εἰσ#ηλθον" "ἀφ#ι_κται"
    # Accent cannot recede beyond last syllable of last prefix
    s2 = "περι#θες" # -> περίθες
    s3 = "συν#εκ#δος" # -> συνέκδος 
    # Accent on 2nd aor imptv retains accent with monosyllabic prefix
    s4 = "προ#δου" ->  # προδο
    # But recedes with polysyllabic prefix
    s5 = "ἀπο#δου" # -> ἀπόδου
    # Compound optatives retain accent of simplex.
    # So we have to KNOW that this is an optative.
    s6 = "ἀπο#δοιτο" # -> ἀποδοῖτο
    # Compound subjunctives are treated both ways in MSS
    s7 = "ἐπι#θηται" # ->  Both ἐπίθηται and ἐπιθῆται  are found
end


@testset "Test breathings of compounds" begin
    s1 = "ἀπ#ἰεναι" # -> ἀπιέναι
    s2 = "ἀπο#οἰσω" # -> ἀποίσω

end

@testset "Test consonant phonology" begin
    s1 = "ἀπο#ἱημι" # -> ἀφίημι
end