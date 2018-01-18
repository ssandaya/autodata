# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Headless"
require 'watir'
require 'headless'
headless = Headless.new
headless.start
b = Watir::Browser.start 'www.google.com'
puts b.title
b.close
headless.destroy