# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"

std_out = $stdout
$stdout = File.new('console2.out', 'w')
$stdout.sync = true
File.methods
$stdout = std_out

sleep 10
File.methods



