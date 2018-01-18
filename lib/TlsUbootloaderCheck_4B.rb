# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'test/unit'

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
    puts "Verify UBootLoader Version"
    system("C:/cygwin64/bin/ssh root@10.20.95.85 \"[ -d /proc/platform ] && (cp /proc/platform/system_info /tmp/system_info_4.txt ; sleep 10)\"")
    system("C:/cygwin64/bin/scp -r root@10.20.95.85:/tmp/system_info_4.txt /cygdrive/c/temp/system_info_4.txt")
    system("C:/cygwin64/bin/chmod +w /cygdrive/c/temp/system_info_4.txt")

    File.foreach("c:/temp/system_info_4.txt") { |line| 
      p line 
      if line.include?("VR BootLoader Version")
        assert_match(/1.0/, line, "Message: Incorrect UBoot Version number")
      end
    }
  end
end