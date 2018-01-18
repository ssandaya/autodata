# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'test_spec'

#describe TestSpec do
#  before(:each) do
#    @test_spec = TestSpec.new
#  end
#
#  it "should desc" do
#    # TODO
#  end
#end

require "rubygems"
require "rspec"
require "watir"
 
describe TestSpec do
  let(:browser) { @browser ||= Watir::Browser.new :firefox } 
  before { browser.goto "http://google.com" } 
  after { browser.close }
 
  it "should search for watir" do
    browser.text_field(:name => "q").set "watir"
    browser.button.click 
    browser.div(:id => "resultStats").wait_until_present
    browser.title.should == "watir - Google Search"
  end
end