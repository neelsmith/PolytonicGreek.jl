@testset "Test concatenating strings for literary Greek" begin
    ortho = literaryGreek()

    @test strcat("λελειπ", "μαι", ortho) == "λελειμμαι"
    @test strcat("λελειπ", "σαι", ortho) == "λελειψαι"
    @test strcat("λελειπ", "ται", ortho) == "λελειπται"

    @test strcat("τετριβ", "μαι", ortho) == "τετριμμαι"
    @test strcat("τετριβ", "σαι", ortho) == "τετριψαι"
    @test strcat("τετριβ", "ται", ortho) == "τετριπται"


    @test strcat("γεγραφ", "μαι", ortho) == "γεγραμμαι"
    @test strcat("γεγραφ", "σαι", ortho) == "γεγραψαι"
    @test strcat("γεγραφ", "ται", ortho) == "γεγραπται"


    @test strcat("πεπλεκ", "μαι", ortho) == "πεπλεγμαι"
    @test strcat("πεπλεκ", "σαι", ortho) == "πεπλεξαι"
    @test strcat("πεπλεκ", "ται", ortho) == "πεπλεκται"
   
    @test strcat("λελεγ", "μαι", ortho) == "λελεγμαι"
    @test strcat("λελεγ", "σαι", ortho) == "λελεξαι"
    @test strcat("λελεγ", "ται", ortho) == "λελεκται"

    @test strcat("βεβρεχ", "μαι", ortho) == "βεβρεγμαι"
    @test strcat("βεβρεχ", "σαι", ortho) == "βεβρεξαι"
    @test strcat("βεβρεχ", "ται", ortho) == "βεβρεκται"


    @test strcat("πεπειθ", "ται", ortho) == "πεπεισται"

    @test strcat("λειπ", "σω", ortho) == "λειψω"
    @test strcat("τριβ", "σω", ortho) == "τριψω"
    @test strcat("γραφ", "σω", ortho) == "γραψω"


    @test strcat("ἐν","πιπτω", ortho) == "ἐμπιπτω"
    @test strcat("ἐν","βαλλω", ortho) == "ἐμβαλλω"
    @test strcat("ἐν","φαινω", ortho) == "ἐμφαινω"

    @test strcat("ἐν","καλεω", ortho) == "ἐγκαλεω"
    @test strcat("ἐν","γραφω", ortho) == "ἐγγραφω"
    @test strcat("συν","χεω", ortho) == "συγχεω"
    @test strcat("συν","ξυω", ortho) == "συγξυω"

    @test strcat("ἐν","μενω", ortho) == "ἐμμενω"

    @test strcat("συν","λογος", ortho) == "συλλογος"
    @test strcat("συν","ρεω", ortho) == "συρρεω"


    @test strcat("δεικ","σ", ortho) == "δειξ"

    @test strcat("συν","οἰσω", ortho) == "συνοισω"

    @test strcat("περι","οἰσω", ortho) == "περιοισω"

    @test strcat("προ","ἠγγελλε", ortho) == "προηγγελλε"

    @test strcat("κατα","ἀγγελλω", ortho, elision = true) == "καταγγελλω"


    @test_broken strcat("κατα","αἱρεω", ortho, elision = true) == "καθαιρεω"

end

#=
@testset "Test working with compounds" begin
    pieces = split("παρα#ἐκ#εν#φέρω","#")
    @test_broken strcat(literaryGreek(), pieces...) == nfkc("παρεξεμ#φέρω")
end
=#


@testset "Test phonology of perfect active consonants" begin
    ortho = literaryGreek()
    
    @test strcat("γεγραπ", "μαι", ortho) == "γεγραμμαι"
    @test strcat("γεγραπ", "σαι", ortho) == "γεγραψαι"
    @test strcat("γεγραπ", "ται", ortho) == "γεγραπται"

    @test strcat("γεγραπ", "μεθα", ortho) == "γεγραμμεθα"
    @test strcat("γεγραπ", "σθε", ortho) == "γεγραφθε"


    @test strcat("γεγραφ", "μαι", ortho) == "γεγραμμαι"
    @test strcat("γεγραφ", "σαι", ortho) == "γεγραψαι"
    @test strcat("γεγραφ", "ται", ortho) == "γεγραπται"

    @test strcat("γεγραφ", "μεθα", ortho) == "γεγραμμεθα"
    @test strcat("γεγραφ", "σθε", ortho) == "γεγραφθε"


    @test strcat("πεπραγ", "μαι", ortho) == "πεπραγμαι"
    @test strcat("πεπραγ", "σαι", ortho) == "πεπραξαι"
    @test strcat("πεπραγ", "ται", ortho) == "πεπρακται"

    @test strcat("πεπραγ", "μεθα", ortho) == "πεπραγμεθα"
    @test strcat("πεπραγ", "σθε", ortho) == "πεπραχθε"
 
end