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

  def test_download_4b
    puts "Tls 4B Download Version"

    require "watir"
    browser = Watir::Browser.new :chrome
    browser.goto "https://10.20.95.85/GeneralSetup/#Login"
    browser.text_field(:id => "gwt-debug-userNameTextBox").set "guest"
    browser.text_field(:id => "gwt-debug-userPasswordTextBox").set "guest"
    browser.button(:id => "gwt-debug-signInButton").click
    sleep 10
    browser.div(:id => "MenuBar4").wait_until(&:present?).click
    sleep 10
    browser.div(:id => "menu-setup-screen15").wait_until(&:present?).click
    sleep 10
    browser.select_list(:class => "gwt-ListBox").select_value "Thumbdrive"
    sleep 10
    
    el = browser.div(:text, "Current Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_current_version =   el.text
    assert_equal(txt_current_version,"7.HB 331.28","Oooops! Incorrect version for upgrade")
    puts "Current Version: " + txt_current_version
    sleep 10
    
    el = browser.div(:text, "Available Version:").parent.parent.td(:align, "left").table(:class, "setup_inside_table").tbody.tr.td.div(:class, "gwt-Label")
    txt_available_version = el.text
    assert_equal(txt_available_version,"Not available","Oooops2!")
    puts "Available Version: " + txt_available_version
    sleep 10
    
    browser.button(:text => "Download").wait_until(&:present?)
    
    assert_equal(browser.button(:text => "Download").present?, true, "Ooooops! Download button not present")
    
    browser.button(:text => "Download").click
    sleep 10
    browser.div(:text => "Download Complete").wait_until_present(timeout: 1800)
    sleep 300
    browser.close
  end
end
