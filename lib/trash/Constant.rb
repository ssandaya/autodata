# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

OUTER_CONST = 99  
  
class Const  
    def get_const  
      CONST  
    end  
    CONST = OUTER_CONST + 1  
end  
  
puts Const.new.get_const  
puts Const::CONST  
puts OUTER_CONST  
puts Const::NEW_CONST = 123  
puts Const::NEW_CONST