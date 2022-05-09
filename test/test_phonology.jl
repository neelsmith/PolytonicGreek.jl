@testset "Test literary Greek phonology" begin
    ortho = literaryGreek()
    @test_broken liquids(ortho) = ["λ","μ","ν","ρ"]
#=
   
#=
liquids = split("λρμν","")
labials = split("βπφ","")
dentals = split("δτθ","")
palatals = split("γκχ","")
stops = vcat(labials, dentals, palatals)
=#
    =#
end