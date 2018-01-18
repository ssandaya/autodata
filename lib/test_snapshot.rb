# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Snapshot
require 'test/unit'
class TestSnapshot < Test::Unit::TestCase
  def initialize(browser)
    @browser = browser
  end
  def assert_equal(expected, got, msg)
    begin
      super(expected, got, msg)
      0
    rescue
      p "caught ya!" # make screenshot here
      
      filename = DateTime.now.strftime("450Plus-Revert" +"-10.20.95.65-" + "%Y%m%d-%H%M%S")
      @browser.screenshot.save ("c:/tmp/#{filename}.png")
      
      raise
      1
    end
  end
  attr_reader :browser
  attr_writer :browser
end
end