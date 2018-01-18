# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'test/unit'

class Test::Unit::TestCase
  def assert_equal(expected, got, msg)
    begin
      super(expected, got, msg)
    rescue
      p "caught ya!" # make screenshot here
      raise
    end
  end
end

#require "./test"
class TlsDownloadVersionFileStatusCheck_4B < Test::Unit::TestCase

  def test_tls_download_version_file_status_check_4b
    puts "Tls Version Download Status Check"

    require "watir"
    browser = Watir::Browser.new :chrome
    browser.goto "https://10.20.95.85/GeneralSetup/#Login"
    browser.text_field(:id, "gwt-debug-userNameTextBox").set "guest"
    browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "guest"
    browser.button(:id, "gwt-debug-signInButton").click
    sleep 10
    browser.div(:text, "Software Maintenance").click
    sleep 10
    browser.div(:text, "Activate / Revert").wait_until(&:present?).click
    sleep 10
    
    el = browser.div(:text, "Current Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_current_version =   el.text
    assert_equal(txt_current_version,"7.HB 331.28","Oooops!")
    puts "Current Version: " + txt_current_version
    sleep 10
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    assert_equal(txt_available_version,"7.HB 331.29","Oooops2!")
    puts "Available Version: " + txt_available_version
    sleep 10
    
    assert_equal(browser.button(:text, "Activate").present?, true, "Ooooops! Activate button not found")
    sleep 10

  end
end
