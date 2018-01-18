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
      
      filename = DateTime.now.strftime("TLS-Download-#{SERVICES['ip_address']}-%Y%m%d-%H%M%S")
      browser.screenshot.save ("#{SERVICES['log_directory']}#{filename}.png")
      
      raise
      1
    end
  end
end

class TestDownload < Test::Unit::TestCase

  def test_download

    require "watir"
    require "headless"
    require 'date'

    puts "Tls download upgrade version"
    puts DateTime.now.strftime("%d/%m/%Y %H:%M:%S-%s")

    headless = Headless.new
    headless.start

    browser = Watir::Browser.new :chrome
    browser.goto SERVICES['url']  
    sleep 30
    browser.text_field(:id => "gwt-debug-userNameTextBox").set SERVICES['tls_user_id']
    browser.text_field(:id => "gwt-debug-userPasswordTextBox").set SERVICES['tls_password']
    sleep 30
    browser.button(:id => "gwt-debug-signInButton").click
    sleep 30
    browser.div(:id => "MenuBar4").wait_until(&:present?).click
    sleep 30
    browser.div(:id => "menu-setup-screen15").wait_until(&:present?).click
    sleep 30
    
    el = browser.div(:text, "Current Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_current_version =   el.text
    puts "Current Version : " + txt_current_version
    puts "Expected Version: " + SERVICES['tls_version_from']
    assert_equal_browser(SERVICES['tls_version_from'], txt_current_version, "Oooops! Incorrect version for upgrade prior to download", browser)
    sleep 30
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    puts "Available Version Before Download: " + txt_available_version
    puts "Expected Version After Download  : " + SERVICES["tls_version_to"]
    sleep 30
    if (txt_available_version == SERVICES["tls_version_to"]) 
      puts "Expected already available - no need to download!"
      0
    end
    sleep 30
    browser.select_list(:class => "gwt-ListBox").select_value "Thumbdrive"
    sleep 30
    browser.button(:text => "Download").wait_until_present(timeout: 1800)
    
    assert_equal_browser(browser.button(:text => "Download").present?, true, "Ooooops! Download button not present", browser)
    
    browser.button(:text => "Download").click
    sleep 300
    browser.div(:text => "Download Complete").wait_until_present(timeout: 600)
    sleep 30

    browser.close
    headless.destroy
    0
  end
end
