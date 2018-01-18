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

    puts ":::stopping tls applications"
    
    system("C:/cygwin64/bin/ssh root@#{SERVICES['ip_address']} '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications stop ; sleep 10)'")

    sleep 10
    puts "::: copying database to tls"
    
    puts "#{SERVICES['local_database_path']}*.tls"
    puts "C:/cygwin64/bin/scp -v #{SERVICES['local_database_path']}*.tls root@#{SERVICES['ip_address']}:/opt/atg/bin"
    system("C:/cygwin64/bin/scp -v #{SERVICES['local_database_path']}*.tls root@#{SERVICES['ip_address']}:/opt/atg/bin >> c:/tmp/testDbInitialization.txt")
    puts ":::starting tls applications"
    
    sleep 10
    system ("C:/cygwin64/bin/ssh root@#{SERVICES['ip_address']} '[ -d /opt/atg/bin ] && (cd /nextgen/dist/bin && /etc/init.d/applications start ; sleep 10)'")

    puts ":::ALL DONE!"



  end
end