@testset "Test concatenating strings for literary Greek" begin
    ortho = literaryGreek()

    @test_broken strcat("λελειπ", "μαι", ortho) == "λελειμμαι"
    @test_broken strcat("λελειπ", "σαι", ortho) == "λελειψαι"
    @test_broken strcat("λελειπ", "ται", ortho) == "λελειπται"

    @test_broken strcat("τετριβ", "μαι", ortho) == "τετριμμαι"
    @test_broken strcat("τετριβ", "σαι", ortho) == "τετριψαι"
    @test_broken strcat("τετριβ", "ται", ortho) == "τετριπται"


    @test_broken strcat("γεγραφ", "μαι", ortho) == "γραμμαι"
    @test_broken strcat("γεγραφ", "σαι", ortho) == "γραψαι"
    @test_broken strcat("γεγραφ", "ται", ortho) == "γραπται"


    @test_broken strcat("πεπλεκ", "μαι", ortho) == "πεπλεγμαι"
    @test_broken strcat("πεπλεκ", "σαι", ortho) == "πεπλεξαι"
    @test_broken strcat("πεπλεκ", "ται", ortho) == "πεπλεκται"
   
    @test_broken strcat("λελεγ", "μαι", ortho) == "λελεγμαι"
    @test_broken strcat("λελεγ", "σαι", ortho) == "λελεξαι"
    @test_broken strcat("λελεγ", "ται", ortho) == "λελεκται"

    @test_broken strcat("βεβρεχ", "μαι", ortho) == "βεβρεγμαι"
    @test_broken strcat("βεβρεχ", "σαι", ortho) == "βεβρεξαι"
    @test_broken strcat("βεβρεχ", "ται", ortho) == "βεβρεκται"


   


    @test_broken strcat("λειπ", "σω", ortho) == "λειψω"
    @test_broken strcat("τριβ", "σω", ortho) == "τριψω"
    @test_broken strcat("γραφ", "σω", ortho) == "γραψω"
    
end