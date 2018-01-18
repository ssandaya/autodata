# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"


require "watir"
browser = Watir::Browser.new :chrome
browser.goto "https://10.2.1.129/#Login"
browser.text_field(:id, "gwt-debug-userNameTextBox").set "user1"
browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "user1"
browser.button(:id, "gwt-debug-signInButton").click
sleep 5
browser.div(:text, "System Administration").click
sleep 5
browser.div(:text, "Users Admin").wait_until_present(timeout: 90)
browser.div(:text, "Users Admin").click
sleep 5
browser.span(:text, "Add New User").wait_until_present(timeout: 90)
browser.span(:text, "Add New User").click
sleep 5
browser.tr(:id, "name").text_field(:class, "gwt-TextBox").clear
browser.tr(:id, "name").text_field(:class, "gwt-TextBox").set "bee"
sleep 5
browser.tr(:id, /fullName/).text_field(:class, "gwt-TextBox").clear
browser.tr(:id, /fullName/).text_field(:class, "gwt-TextBox").set "bee"
sleep 5
browser.tr(:id, "email").text_field(:class, "gwt-TextBox").clear
browser.tr(:id, "email").text_field(:class, "gwt-TextBox").set "sandaya@veeder.com"
sleep 5
browser.tr(:id, "password").text_field(:class, "gwt-PasswordTextBox").clear
browser.tr(:id, "password").text_field(:class, "gwt-PasswordTextBox").set "bee"
sleep 5
browser.tr(:id, "repeatpassword").text_field(:class, "gwt-PasswordTextBox").clear
browser.tr(:id, "repeatpassword").text_field(:class, "gwt-PasswordTextBox").set "bee"
#sleep 5
#browser.tr(:id, "gwt-uid-360").click
sleep 5
browser.button(:id, "gwt-debug-Save").wait_until_present(timeout: 90)
browser.button(:id, "gwt-debug-Save").click
sleep 10
puts "::: doing random clicks"
browser.div(:text, "Diagnostics").wait_until_present(timeout: 90)
browser.div(:text, "Diagnostics").click
sleep 5
browser.div(:text, "Module").wait_until_present(timeout: 90)
browser.div(:text, "Module").click
sleep 5
browser.div(:text, "Hardware Configuration").wait_until_present(timeout: 90)
browser.div(:text, "Hardware Configuration").click
sleep 5
browser.div(:text, "Device Directory").wait_until_present(timeout: 90)
browser.div(:text, "Device Directory").click
sleep 5
browser.div(:text, "Device Assignments").wait_until_present(timeout: 90)
browser.div(:text, "Device Assignments").click
sleep 5
browser.div(:text, "Comm").wait_until_present(timeout: 90)
browser.div(:text, "Comm").click
sleep 5
browser.div(:text, "Firmware Upgrade").wait_until_present(timeout: 90)
browser.div(:text, "Firmware Upgrade").click
sleep 5
browser.div(:text, "IFSF").wait_until_present(timeout: 90)
browser.div(:text, "IFSF").click
sleep 5
browser.a(:text, "Log Out").wait_until_present(timeout: 90)
browser.a(:text, "Log Out").click
sleep 5

#browser.   #fullName > td:nth-child(2) > table > tbody > tr > td:nth-child(1) > input
sleep 50
