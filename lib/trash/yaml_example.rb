# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require "yaml"

puts "YAML Example"
configFile = File.dirname(__FILE__) + "/../config/default_4B.yml"
puts "#{configFile}"
$config = YAML.load_file(configFile)
p $config["url"]
p $config["tls_version_from"]
p $config["tls_version_to"]
p $config["tls_user_id"]
p $config["tls_password"]
p $config["admin_id"]
p $config["admin_password"]
p $config["operator_id"]
p $config["operator_password"]



