
 """List code points for liquid consonants in literary Greek.

 $(SIGNATURES)
 """
 function liquids(ortho::LiteraryGreekOrthography) 
    split("λμνρ","")
 end  


 """List code points for labial consonants in literary Greek.

 $(SIGNATURES)
 """
 function labials(ortho::LiteraryGreekOrthography) 
    split("πβφ","")
 end 
 
 """List code points for dental consonants in literary Greek.

 $(SIGNATURES)
 """
 function dentals(ortho::LiteraryGreekOrthography) 
    split("τδθ","")
 end  

 """List code points for palatal consonants in literary Greek.

 $(SIGNATURES)
 """
 function palatals(ortho::LiteraryGreekOrthography) 
    split("κγχ","")
 end 


#=

labials = split("βπφ","")
dentals = split("δτθ","")
palatals = split("γκχ","")
stops = vcat(labials, dentals, palatals)
=#