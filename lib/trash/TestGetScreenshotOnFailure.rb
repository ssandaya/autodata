# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'test/unit'

class Test::Unit::TestCase
  def assert_equal(expected, got, msg)
    begin
      super(expected, got, msg)
    rescue
      p "caught ya!" # make screenshot here
      raise
    end
  end
end

class DemoTest < Test::Unit::TestCase

  def test_fail
    assert_equal(1, 0, 'ups')
  end
end