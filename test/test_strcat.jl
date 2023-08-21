@testset "Test concatenating strings for literary Greek" begin
    ortho = literaryGreek()

    @test strcat(ortho, "λελειπ", "μαι") == "λελειμμαι"
    @test strcat(ortho, "λελειπ", "σαι") == "λελειψαι"
    @test strcat(ortho, "λελειπ", "ται") == "λελειπται"

    @test strcat(ortho, "τετριβ", "μαι") == "τετριμμαι"
    @test strcat(ortho, "τετριβ", "σαι") == "τετριψαι"
    @test strcat(ortho, "τετριβ", "ται") == "τετριπται"


    @test strcat(ortho, "γεγραφ", "μαι") == "γεγραμμαι"
    @test strcat(ortho, "γεγραφ", "σαι") == "γεγραψαι"
    @test strcat(ortho, "γεγραφ", "ται") == "γεγραπται"


    @test strcat(ortho, "πεπλεκ", "μαι") == "πεπλεγμαι"
    @test strcat(ortho, "πεπλεκ", "σαι") == "πεπλεξαι"
    @test strcat(ortho, "πεπλεκ", "ται") == "πεπλεκται"
   
    @test strcat(ortho, "λελεγ", "μαι") == "λελεγμαι"
    @test strcat(ortho, "λελεγ", "σαι") == "λελεξαι"
    @test strcat(ortho, "λελεγ", "ται") == "λελεκται"

    @test strcat(ortho, "βεβρεχ", "μαι") == "βεβρεγμαι"
    @test strcat(ortho, "βεβρεχ", "σαι") == "βεβρεξαι"
    @test strcat(ortho, "βεβρεχ", "ται") == "βεβρεκται"


    @test strcat(ortho, "πεπειθ", "ται") == "πεπεισται"

    @test strcat(ortho, "λειπ", "σω") == "λειψω"
    @test strcat(ortho, "τριβ", "σω") == "τριψω"
    @test strcat(ortho, "γραφ", "σω") == "γραψω"


    @test strcat(ortho, "ἐν","πιπτω") == "ἐμπιπτω"
    @test strcat(ortho, "ἐν","βαλλω") == "ἐμβαλλω"
    @test strcat(ortho, "ἐν","φαινω") == "ἐμφαινω"

    @test strcat(ortho, "ἐν","καλεω") == "ἐγκαλεω"
    @test strcat(ortho, "ἐν","γραφω") == "ἐγγραφω"
    @test strcat(ortho, "συν","χεω") == "συγχεω"
    @test strcat(ortho, "συν","ξυω") == "συγξυω"

    @test strcat(ortho, "ἐν","μενω") == "ἐμμενω"

    @test strcat(ortho, "συν","λογος") == "συλλογος"
    @test strcat(ortho, "συν","ρεω") == "συρρεω"


    @test strcat(ortho, "δεικ","σ") == "δειξ"

    @test strcat(ortho, "συν","οἰσω") == "συνοισω"

    @test strcat(ortho, "περι","οἰσω") == "περιοισω"

    @test strcat(ortho, "προ","ἠγγελλε") == "προηγγελλε"

    @test strcat(ortho, "κατα","ἀγγελλω", elision = true) == "καταγγελλω"


    @test strcat(ortho, "κατα","αἱρεω", elision = true) == "καθαιρεω"

end

@testset "Test working with compounds" begin
    @test strcat(literaryGreek(), nfkc("ἐν"), nfkc("κελεύω")) == nfkc("ἐγκελεύω")
    @test strcat(literaryGreek(), nfkc("ἐν"), "κε", nfkc("λεύ"), "ω") == nfkc("ἐγκελεύω")
end



@testset "Test phonology of perfect active consonants" begin
    ortho = literaryGreek()
    
    @test strcat(ortho,"γεγραπ", "μαι") == "γεγραμμαι"
    @test strcat(ortho,"γεγραπ", "σαι") == "γεγραψαι"
    @test strcat(ortho,"γεγραπ", "ται") == "γεγραπται"

    @test strcat(ortho,"γεγραπ", "μεθα") == "γεγραμμεθα"
    @test strcat(ortho,"γεγραπ", "σθε") == "γεγραφθε"


    @test strcat(ortho,"γεγραφ", "μαι") == "γεγραμμαι"
    @test strcat(ortho,"γεγραφ", "σαι") == "γεγραψαι"
    @test strcat(ortho,"γεγραφ", "ται") == "γεγραπται"

    @test strcat(ortho,"γεγραφ", "μεθα") == "γεγραμμεθα"
    @test strcat(ortho,"γεγραφ", "σθε") == "γεγραφθε"


    @test strcat(ortho,"πεπραγ", "μαι") == "πεπραγμαι"
    @test strcat(ortho,"πεπραγ", "σαι") == "πεπραξαι"
    @test strcat(ortho,"πεπραγ", "ται") == "πεπρακται"

    @test strcat(ortho,"πεπραγ", "μεθα") == "πεπραγμεθα"
    @test strcat(ortho,"πεπραγ", "σθε") == "πεπραχθε"

    @test strcat(ortho, "ἠρχ","κα") == "ἠρχα"

    @test strcat(ortho,"ἐβη", "") == "ἐβη"

    @test strcat(ortho,"ἀρχ", "κ") == "ἀρχ"
 
end