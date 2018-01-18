# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


puts "4B Tls Diagnose Version Activate"

ARGV.each do|a|
  puts "Argument: #{a}"
end

v1 = ARGV[0]
v2 = ARGV[1]
puts v1
puts v2



require "watir"
require "yaml"
require "rubygems"
require "json"


configFile = File.dirname(__FILE__) + "/config/default_4B.yml"
jsonFile = File.dirname(__FILE__) + "/config/input.json"


puts "#{configFile}"
$config = YAML.load_file(configFile)
#Now to get the value of the Key and value :
puts $config["Site"]["url"]
puts $config["Site"]["user_id"]
puts $config["Passblock"]["password2"]

#puts "JSON"
#puts "#{jsonFile}"
#json_obj = JSON.load(File.read(jsonFile))
#
#puts json_obj
#puts json_obj["President"]
#puts json_obj["India"]
#
#puts json_obj["WithSubKey"]
#puts json_obj["WithSubKey"]["two"]









  

#browser = Watir::Browser.new :chrome
#
#browser.goto "https://10.20.95.65/GeneralSetup/#Login"
#browser.text_field(:id, "gwt-debug-userNameTextBox").set "guest"
#browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "guest"
#browser.button(:id, "gwt-debug-signInButton").click
#sleep 10
#browser.div(:text, "Software Maintenance").click
#sleep 10
#browser.div(:text, "Activate / Revert").wait_until(&:present?).click
#sleep 10

#browser.button(:text, "Activate").wait_until(&:present?).click
#sleep 10
#browser.button(:text, "Yes").click
sleep 1800
browser.close
