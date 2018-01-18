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

class DemoTest < Test::Unit::TestCase

  def test_activate_4b
    puts "4B Tls Version Activate"

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
    assert_equal(txt_current_version,"7.HB 331.28","Oooops! Current version incorrect")
    puts "Current Version: " + txt_current_version
    sleep 10
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    assert_equal(txt_available_version,"7.HB 331.29","Oooops! Available version incorrect")
    puts "Available Version: " + txt_available_version
    sleep 10
    
    assert_equal(browser.button(:text, "Activate").present?, true, "Ooooops! Activate button not found")
    sleep 10

    
    browser.button(:text, "Activate").wait_until(&:present?).click
    sleep 10
    browser.button(:text, "Yes").click
    sleep 900
    browser.close
  end
end