require 'spec_helper'

describe Game do
  it "should build a board when given a string of tiles" do
    game = Game.new('---------')
    game.board.tiles.should eq('---------')
    game.board.size.should eq(3)
    game.board.move_count.should eq(0)
  end

  it "should make the appropriate computer move" do
    scenarios = [ ['OO-X--XX-','OOOX--XX-'],
                  ['X--------','X---O----'],
                  ['XX--O----','XXO-O----']  ]

    scenarios.each_with_index do |tiles, i|
      game = Game.new(tiles[0])
      game.computer_move
      game.board.tiles.should eq(tiles[1]), "Test #{i+1}: #{tiles[0]} should lead to #{tiles[1]}"
    end
  end
end
