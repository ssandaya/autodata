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
class DemoTest < Test::Unit::TestCase

  def test_upgrade_450Plus
    puts "Tls 450Plus  Version Upgrade Status Check"

    require "watir"
    browser = Watir::Browser.new :chrome
    browser.goto "https://10.20.95.65/GeneralSetup/#Login"
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
    assert_equal(txt_available_version,"Not available","Oooops2!")
    puts "Available Version: " + txt_available_version
    sleep 10
    
    assert_equal(browser.button(:text, "Activate").present?, true, "Ooooops3!")
    sleep 10

    sleep 10

  end
end
