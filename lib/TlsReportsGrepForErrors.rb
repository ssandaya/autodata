# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require 'test/unit'
require 'Date'

class Test::Unit::TestCase
  def assert_equal(expected, got, msg)
    begin
      super(expected, got, msg)
      0
    rescue
      p "caught ya!" # make screenshot here
      raise
      1
    end
  end
end
#$LOAD_PATH.unshift(File.dirname(__FILE__))
#require "./test"
class UbootVersion < Test::Unit::TestCase

  def test_uboot_version
    puts "Check for ERROR in All Logs"
    d = Time.now
    

    system("C:/cygwin64/bin/ssh tlsadmin@10.20.95.65 \"[ -d / ] && (grep \"error\" /**/*/*.log ; sleep 10)\" > report_output/rpt_grep_error_file_" + Time.now.strftime("%Y%m%d-%H%M%S") +".txt")
    puts system("C:/cygwin64/bin/ssh tlsadmin@10.20.95.65 \"[ -d / ] && (grep \"error\" /**/*/*.log ; sleep 10)\" ")

  end
end