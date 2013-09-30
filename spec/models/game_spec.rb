require 'spec_helper'

describe Game do
  it "should build a board when given a string of tiles" do
    board = Game.create_board('---------')
    board.tiles.should eq('---------')
    board.size.should eq(3)
    board.move_count.should eq(0)
  end

  it "should make the appropriate computer move" do
    scenarios = [ ['OO-X--XX-','OOOX--XX-'],
                  ['X--------','X---O----'],
                  ['XX--O----','XXO-O----']
                ]

    scenarios.each_with_index do |tiles, i|
      board = Game.create_board(tiles[0])
      Game.computer_move(board)
      board.tiles.should eq(tiles[1]), "Test #{i+1}: #{tiles[0]} should lead to #{tiles[1]}"
    end
  end
end
