require 'test/unit'
require 'yaml'

class MyTestCase < Test::Unit::TestCase
  filepath = File.dirname(__FILE__) + "/config/tls_defaultB.yml"
  SERVICES = YAML::load_file(File.open(filepath))
  def assert_equal_browser(expected, got, msg, browser)
    begin
      assert_equal(expected, got, msg)
      0
    rescue
      p "caught ya!" # make screen shot here
      
      filename = DateTime.now.strftime("TLS-Activate-#{SERVICES['ip_address']}-%Y%m%d-%H%M%S")
      browser.screenshot.save ("#{SERVICES['log_directory']}#{filename}.png")
      
      raise
      1
    end
  end
end

class TestActivate < MyTestCase

  def test_activate
    
    puts "Tls Version Activate"

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
    puts "Current Version : " + txt_current_version
    puts "Expected Version: " + SERVICES["tls_version_from"]
    assert_equal_browser(SERVICES["tls_version_from"], txt_current_version,"Oooops! Current version incorrect", browser)
    sleep 10
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    puts "Available Version: " + txt_available_version
    puts "Expected Version : " + SERVICES["tls_version_to"]
    assert_equal_browser(SERVICES["tls_version_to"], txt_available_version,"Oooops! Available version incorrect", browser)
    sleep 10
    
    assert_equal_browser(browser.button(:text, "Activate").present?, true, "Ooooops! Activate button not found", browser)
    sleep 15
    browser.button(:text, "Activate").click
    sleep 15
    browser.button(:text, "Yes").click
    sleep 300
    puts "Activate complete -"

    browser.close
    headless.destroy
    0
  end
end
