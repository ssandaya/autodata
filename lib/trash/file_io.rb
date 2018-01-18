#!/usr/bin/ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"


aFile = File.new("input.txt", "w+")
if aFile
   aFile.syswrite("ABCDEF")
else
   puts "Unable to open file!"
end