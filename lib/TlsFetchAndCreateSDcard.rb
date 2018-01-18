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
    puts "Database Initialization"

    puts ":::fetching TLS software"
    
    system("C:/cygwin64/bin/ssh root@#{SERVICES['ip_address']} '[ -d /opt/common/bin ] && ( cd /opt/common/bin && ./fetch.sh http://gvrsimeng02.sim.gilbarco.com/debug_builds/beta-releases/3420047GB.v33126 ; sleep 10)'")
    puts "Return Value"
    puts $?
    sleep 10
    
    puts "::: creating SD card"
    
    system("C:/cygwin64/bin/ssh root@#{SERVICES['ip_address']} '[ -d /tmp/stage ] && ( cd /tmp/stage && ./create.sh --ip 10.20.95.65 --gw 10.20.95.1 --dns 10.20.77.54 --hostname satls450p1 ; reboot; sleep 10)'")
    puts "Return Value"
    puts $?
    sleep 10

    system("C:/cygwin64/bin/ssh root@#{SERVICES['ip_address']} '[ -d /tmp/stage ] && ( cd /tmp/stage && reboot ; sleep 10)'")
    puts "Return Value"
    puts $?
    sleep 10
    puts ":::ALL DONE!"



  end
end