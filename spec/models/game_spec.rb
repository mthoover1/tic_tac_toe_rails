require 'spec_helper'

describe Game do
  it "should build a board when given a string of tiles" do
    board = Game.build_board('---------')
    board.tiles.should eq('---------')
    board.size.should eq(3)
    board.move_count.should eq(0)
  end

  xit "should make the appropriate computer move" do

  end
end
