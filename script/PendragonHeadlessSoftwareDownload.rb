
require 'watir'
require 'rspec/expectations'
require 'headless'
include RSpec::Matchers

def setup
  @headless = Headless.new
  @headless.start
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
  @headless.destroy
end

def run
  setup
  yield
  teardown
end

run do
  @driver.get 'http://pendragon.sim.gilbarco.com/'
  expect(@driver.title).to eql 'Pendragon Pen Drive Extractor'
  @driver.select_list(:name, "partfile").select_value /v33140/
  sleep 5
  @driver.radio(:value,"tar" ).wait_until(&:present?).set
  sleep 5
  @driver.button(:text, "Process file").wait_until(&:present?).click
  sleep 5
  @driver.td(:text => "Download:").wait_until_present(timeout: 900)
  sleep 5
  @driver.a(:href,/thumb/).wait_until_present(timeout: 10).click
  sleep 5
  #@driver.a(:href,/thumb/).
  sleep 500

#  @driver.save_screenshot 'headless2.png'

end


