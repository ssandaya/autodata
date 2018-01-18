# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Test Unit Example"
require 'test/unit'
require 'watir'

class Test_google <Test::Unit::TestCase

  def test_50
    #@Browser=Watir::IE.new
    @Browser=Watir::Browser.new :chrome
    @Browser.goto "http://www.google.com"
    puts "hello  50"
    assert(@Browser.text_field(:name,"q").exists?,"Error opening Homepage")
  end
  
  
  
  def test_200
    puts "hello 200"
  end
  
  def test_100
    puts "hello 100"
  end
end