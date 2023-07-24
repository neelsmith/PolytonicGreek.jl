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


 """True if token has a vowel with rough breathing.
 $(SIGNATURES)
 """
 function rough(s, ortho::LiteraryGreekOrthography)
   sylls = syllabify(s,ortho)
 end

"""Make string `s` begin with an aspirate.
$(SIGNATURES)
"""
function aspirate(cp, ortho::LiteraryGreekOrthography = literaryGreek())
   if haskey(aspiratedict, cp)
     aspiratedict[cp]
   else
      cp
   end
end

"""Map stops to equivalent aspirate."""
aspiratedict = Dict(
   'τ' => "θ",
   'π' => "φ",
   'κ' => "χ",

   'δ' => "θ",
   'β' => "φ",
   'γ' => "χ",
)
