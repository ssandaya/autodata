require 'test/unit'
require 'yaml'

require 'test/unit'
require 'yaml'

class Test::Unit::TestCase
  filepath = File.dirname(__FILE__) + "/config/tls_defaultB.yml"
  SERVICES = YAML::load_file(File.open(filepath))
  def assert_equal_browser(expected, got, msg, browser)
    begin
      assert_equal(expected, got, msg)
      0
    rescue
      p "caught ya!" # make screenshot here
      
      filename = DateTime.now.strftime("TLS-Revert-#{SERVICES['ip_address']}-%Y%m%d-%H%M%S")
      browser.screenshot.save ("#{SERVICES['log_directory']}#{filename}.png")
      
      raise
      1
    end
  end
end

class TestRevert < Test::Unit::TestCase

  def test_revert
    puts "Tls Version Revert"

    require "watir"
    require "headless"
    headless = Headless.new
    headless.start

    browser = Watir::Browser.new :chrome
    browser.goto SERVICES['url']  
    browser.text_field(:id => "gwt-debug-userNameTextBox").set SERVICES['tls_user_id']
    browser.text_field(:id => "gwt-debug-userPasswordTextBox").set SERVICES['tls_password']
    browser.button(:id => "gwt-debug-signInButton").click
    sleep 10
    browser.div(:text, "Software Maintenance").wait_until(&:present?).click
    sleep 10
    browser.div(:text, "Activate / Revert").wait_until(&:present?).click
    sleep 10

    el = browser.div(:text, "Current Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_current_version =   el.text
    puts "Current Version : " + txt_current_version
    puts "Expected Version: " + SERVICES["tls_version_to"]
    puts
    assert_equal_browser(SERVICES["tls_version_to"],txt_current_version,"Oooops: Incorrect current version", browser)
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    puts "Available Version: " + txt_available_version
    puts "Expected Version : " + SERVICES["tls_version_from"]
    assert_equal_browser(SERVICES["tls_version_from"],txt_available_version,"Oooops!  Incorrect available version", browser)
    
    sleep 10
    assert_equal_browser(browser.button(:text, "Revert...").present?, true, "Ooooops! Revert button not present", browser)

    browser.button(:text, "Revert...").wait_until(&:present?).click
    sleep 15
    browser.button(:text, "Yes").wait_until(&:present?).click
    sleep 360
    puts "Revert complete -"
    puts "Current Version: " + SERVICES["tls_version_from"]
    browser.close
    headless.destroy
    exit 0
  end
end
