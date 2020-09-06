module Concerns::Findable 
  

   
 def find_by_name(name) 
    all.find do |x|
      binding.pry 
 if x.name == name 
   end 
 end
 end
   def find_or_create_by_name(name)
     find_by_name(name) || create(name)
   end
   end  
