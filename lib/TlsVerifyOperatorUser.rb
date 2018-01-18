# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Tls Verify Operator User"

require "watir"
browser = Watir::Browser.new :chrome
browser.goto "https://10.2.1.129/#Login"
browser.text_field(:id, "gwt-debug-userNameTextBox").set "oper1"
browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "oper1"
browser.button(:id, "gwt-debug-signInButton").click
sleep 5
browser.div(:text, "Diagnostics").click

sleep 5
browser.div(:text, "AccuChart").click
sleep 5
browser.div(:text, "Chart Comparison").click
sleep 5
browser.select_list(:class => "device_select_filter").select_value /Tank 1/
sleep 5
browser.div(:text, "Calibration Feedback").click
sleep 5
browser.div(:text, "Delivery Instructions").click
sleep 5
browser.div(:text, "Data Sufficiency").click

sleep 5
browser.div(:text, "Meter").click
sleep 5
browser.div(:text, "Meter Events").click
sleep 5
browser.div(:text, "Tank Map").click
sleep 5
browser.div(:text, "Manual Mapping").click


sleep 5
browser.div(:text, "Tank").click
sleep 5
browser.div(:text, "30 Sec. Inv. Samples").click

sleep 20





