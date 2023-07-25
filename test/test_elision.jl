@testset "Test elision" begin
    ortho = literaryGreek()

    e1 = elide("συν","οισω",ortho)
    @test e1 == "συν"
    e2 = elide("περι","οισω",ortho)
    @test e2 == "περι"
    e3 = elide("προ","οισω",ortho)
    @test e3 == "προ"
    e4 = elide("παρα","οισω",ortho)
    @test e4 == "παρ"
    e5 = elide("κατα","οισω",ortho)
    @test e5 == "κατ"
end

@testset "Test string concatenation with elision" begin
    ortho = literaryGreek()
    @test strcat("παρα","οισω", ortho) == "παροισω"
    @test strcat("παρα","οισω", ortho, elision = false) == "παραοισω"
end