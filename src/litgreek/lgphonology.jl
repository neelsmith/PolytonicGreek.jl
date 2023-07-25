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


"""Aspirate char `cp`.
$(SIGNATURES)
"""
function aspirate(cp::AbstractChar, ortho::LiteraryGreekOrthography = literaryGreek())
   if haskey(aspiratedict, cp)
     aspiratedict[cp]
   else
      cp
   end
end




"""Aspirate final consonant of string `s`.
$(SIGNATURES)
"""
function aspiratefinal(s::AbstractString, ortho::LiteraryGreekOrthography = literaryGreek())
  indexes = collect(eachindex(s))
  quit = indexes[end-1]
  aspirated = aspirate(s[indexes[end]], ortho)
  string(s[1:quit], aspirated)
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
