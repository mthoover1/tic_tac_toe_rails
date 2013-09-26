class Game
  def self.build_board(tiles)
    size = Math.sqrt(tiles.length)
    board = Board.new(size.to_i)
    board.tiles = tiles
    board.move_count = board.count_moves
    board
  end

  def self.computer_move(board)
    unless board.won? || board.tied? || board.future_cats_game?
      if board.move_count.odd?
        computer = ComputerPlayer.new(board)
        computer.move
      end
    end
  end
end
