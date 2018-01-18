# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"

system("cd C:\\Projects\\Ver_00.00.940.12")
system("java -javaagent:automaton-1.3.2-all-deps.jar=simpleAScript.groovy -classpath * com.veeder.interactive.gui.GasStationGUI")

