# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'yaml'
class UserService
    filepath = File.dirname(__FILE__) + "/../config/default_4B.yml"
    SERVICES = YAML::load_file(File.open(filepath))
    
    def initialize

    end

end


url = UserService::SERVICES['url']
p url