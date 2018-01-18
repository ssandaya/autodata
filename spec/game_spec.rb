# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#require 'game'
#
#describe Game do
#  before(:each) do
#    @game = Game.new
#  end
#
#  it "should desc" do
#    # TODO
#  end
#end

# game_spec.rb
require './game'
RSpec.describe Game do
  describe "#score" do
    it "returns 0 for an all gutter game" do
      game = Game.new
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end
  end
end