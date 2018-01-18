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
#require "test"
class UpgradeStatusCheck_450Plus < Test::Unit::TestCase

  def test_upgrade_status_check_450plus
    puts "Tls 450Plus Version Upgrade Status Check"
    puts  $LOAD_PATH

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
    puts "Upgrade Version : " + txt_current_version
    puts "Expected Version: " + SERVICES["tls_version_to"]
    assert_equal_browser(SERVICES["tls_version_to"],txt_current_version,"Oooops! Incorrect current version", browser)
    sleep 10
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    puts "Available Version: " + txt_available_version
    puts "Expected Version: " + SERVICES["tls_version_from"]
    assert_equal_browser(SERVICES["tls_version_from"],txt_available_version,"Oooops2! Incorrect available version", browser)
    puts "Available Version: " + txt_available_version
    sleep 10

  end
end
