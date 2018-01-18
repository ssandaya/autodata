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

  def test_revert_450Plus
    puts "4B Tls Version Revert"

    require "watir"
    browser = Watir::Browser.new :chrome
    #puts "Login in to 10.20.95.85"
    browser.goto "https://10.20.95.85/GeneralSetup/#Login"
    browser.text_field(:id, "gwt-debug-userNameTextBox").set "guest"
    browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "guest"
    browser.button(:id, "gwt-debug-signInButton").click
    sleep 10
    #puts "Login successful"
    browser.div(:text, "Software Maintenance").click
    sleep 10
    browser.div(:text, "Activate / Revert").wait_until(&:present?).click
    sleep 10
    
    el = browser.div(:text, "Current Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_current_version =   el.text
    assert_equal(txt_current_version,"7.HB 331.29","Oooops: Incorrect current version")
    puts "Current Version: " + txt_current_version
    sleep 10
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    assert_equal(txt_available_version,"7.HB 331.28","Oooops!  Incorrect available version")
    puts "Available Version: " + txt_available_version
    sleep 10
    
    assert_equal(browser.button(:text, "Revert...").present?, true, "Ooooops! Revert button not present")
    sleep 10

    browser.button(:text, "Revert...").wait_until(&:present?).click
    sleep 10
    browser.button(:text, "Yes").wait_until(&:present?).click
    sleep 900
    #puts "Revert successful"
    browser.close

  end
end
