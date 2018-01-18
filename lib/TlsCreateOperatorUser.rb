
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"

require "watir"
browser = Watir::Browser.new :chrome
browser.goto "https://10.2.1.129/#Login"
browser.text_field(:id, "gwt-debug-userNameTextBox").set "guest"
browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "guest"
browser.button(:id, "gwt-debug-signInButton").click
sleep 3
browser.div(:text, "System Administration").click
sleep 3
browser.div(:text, "Users Admin").wait_until_present(timeout: 90)
browser.div(:text, "Users Admin").click
sleep 3
browser.span(:text, "Add New User").wait_until_present(timeout: 90)
browser.span(:text, "Add New User").click

# enter user name and password
sleep 3
browser.tr(:id, "name").text_field(:class, "gwt-TextBox").clear
browser.tr(:id, "name").text_field(:class, "gwt-TextBox").set "oper1"
sleep 3
browser.tr(:id, /fullName/).text_field(:class, "gwt-TextBox").clear
browser.tr(:id, /fullName/).text_field(:class, "gwt-TextBox").set "oper1"
sleep 3
browser.select_list(:class => "gwt-ListBox").select_value "Operator"
sleep 3
browser.tr(:id, "email").text_field(:class, "gwt-TextBox").clear
browser.tr(:id, "email").text_field(:class, "gwt-TextBox").set "sandaya@veeder.com"

# enter password
sleep 3
browser.tr(:id, "password").text_field(:class, "gwt-PasswordTextBox").clear
browser.tr(:id, "password").text_field(:class, "gwt-PasswordTextBox").set "oper1"
sleep 3
browser.tr(:id, "repeatpassword").text_field(:class, "gwt-PasswordTextBox").clear
browser.tr(:id, "repeatpassword").text_field(:class, "gwt-PasswordTextBox").set "oper1"
#sleep 3
#browser.tr(:id, "gwt-uid-360").click
sleep 3
browser.button(:id, "gwt-debug-Save").wait_until_present(timeout: 90)
browser.button(:id, "gwt-debug-Save").click

sleep 10

