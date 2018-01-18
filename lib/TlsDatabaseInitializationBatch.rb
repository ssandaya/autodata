# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'test/unit'
require 'yaml'

class Test::Unit::TestCase
  filepath = File.dirname(__FILE__) + "/config/tls_default.yml"
  SERVICES = YAML::load_file(File.open(filepath))
  def assert_equal_browser(expected, got, msg, browser)
    begin
      assert_equal(expected, got, msg)
      0
    rescue
      p "caught ya!" # make screen shot here
      
      filename = DateTime.now.strftime("TLS-DatabaseLoad-#{SERVICES['ip_address']}-%Y%m%d-%H%M%S")
      browser.screenshot.save ("#{SERVICES['log_directory']}#{filename}.png")
      
      raise
      1
    end
  end
end


class DatabaseInitTest < Test::Unit::TestCase

  def test_database_initialization
    $stdout = File.new('c:/tmp/console.out', 'w')

    $stdout.sync = true
    puts "Database Initialization Batch"

    system("cmd /c start /wait c:/temp/test123.bat")

    sleep 10
    
    puts ":::Batch Run Done!"



  end
end