# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Dummy  
  def method_missing(m, *args, &block)  
    puts "There's no method called #{m} here #{args.each {|e| puts e }}-- please try again."  
  end  
end  
Dummy.new.anything  