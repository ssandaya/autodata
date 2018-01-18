# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Page Object Before"

puts "4B Tls Diagnose Version Activate"

require "watir"
require "test/unit"
browser = Watir::Browser.new :chrome

browser.goto "https://10.20.95.65/GeneralSetup/#Login"
browser.text_field(:id, "gwt-debug-userNameTextBox").set "guest"
browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "guest"
browser.button(:id, "gwt-debug-signInButton").click
sleep 10
assert_equal(browser.div(:text, "Software Maintenance").present?, false, "Error: blah")
browser.div(:text, "Software Maintenance").click


sleep 300
