# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'test/unit'
class Test::Unit::TestCase
  def assert_equal(expected, got, msg, browser)
    begin
      super(expected, got, msg)
      0
    rescue
      p "caught ya!" # make screenshot here
      
      filename = DateTime.now.strftime("450Plus-Revert" +"-10.20.95.65-" + "%Y%m%d-%H%M%S")
      browser.screenshot.save ("c:/tmp/#{filename}.png")
      
      raise
      1
    end
  end
end

#require "./test_snapshot"
class TestRevert < Test::Unit::TestCase

  def test_revert
    
    puts "Tls 450Plus Version Revert"

    require "watir"
    browser = Watir::Browser.new :chrome
    browser.goto "https://10.20.95.65/GeneralSetup/#Login"
    sleep 3
    browser.text_field(:id, "gwt-debug-userNameTextBox").set "guest"
    browser.text_field(:id, "gwt-debug-userPasswordTextBox").set "guest"
    browser.button(:id, "gwt-debug-signInButton").wait_until(&:present?).click
    browser.div(:text, "Software Maintenance").wait_until(&:present?).click
    sleep 10
    browser.div(:text, "Activate / Revert").wait_until(&:present?).click
    sleep 10
    el = browser.div(:text, "Current Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_current_version =   el.text
    assert_equal("7.HB 331.29",txt_current_version,"Oooops: Incorrect current version", browser)
    puts "Current Version: " + txt_current_version
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    assert_equal("7.HB 331.28",txt_available_version,"Oooops!  Incorrect available version", browser)
    puts "Available Version: " + txt_available_version
    
    sleep 10
    assert_equal(browser.button(:text, "Revert...").present?, true, "Ooooops! Revert button not present", browser)


    browser.button(:text, "Revert...").wait_until(&:present?).click
    browser.button(:text, "Yes").wait_until(&:present?).click
    sleep 600
    browser.close

  end
end
