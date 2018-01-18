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
      p "caught ya!" # make screenshot here
      
      filename = DateTime.now.strftime("TLS-ActivateCheck-#{SERVICES['ip_address']}-%Y%m%d-%H%M%S")
      browser.screenshot.save ("#{SERVICES['log_directory']}#{filename}.png")
      
      raise
      1
    end
  end
end

class ActivateStatusCheck < Test::Unit::TestCase

  def test_activate_status_check
    puts "Tls Version Activate Status Check"

    require "watir"
    require "headless"
    headless = Headless.new
    headless.start

    browser = Watir::Browser.new :chrome
    browser.goto SERVICES['url']  
    browser.text_field(:id, "gwt-debug-userNameTextBox").set SERVICES['tls_user_id']
    browser.text_field(:id, "gwt-debug-userPasswordTextBox").set SERVICES['tls_password']
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
    puts
    puts "Available Version: " + txt_available_version
    puts "Expected Version : " + SERVICES["tls_version_from"]
    assert_equal_browser(SERVICES["tls_version_from"],txt_available_version,"Oooops2! Incorrect available version", browser)
    puts
    puts "Activation check looks good!"
    sleep 10
    
    headless.destroy
    sleep 10

  end
end
