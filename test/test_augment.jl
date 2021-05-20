
@testset "Test augment" begin
    lg = literaryGreek()
    @test  augment(lg) == nfkc("ἐ")
    @test augment(lg; s = "κελευε") == nfkc("ἐκελευε")
    @test augment(lg; s = "ῥυε") == nfkc("ἐρρυε")
    @test augment(lg; s = "ἀκουσε") == nfkc("ἠκουσε")
    
end



#=
- vowels:
    - ai -> h\|
    - ei -> h\|
    - eu -> hu
    - oi -> w\|

    √ - a -> h
    - e -> h
    - o -> w
    - i  -> i_
    - u -> u_

    - h
    - w

=#