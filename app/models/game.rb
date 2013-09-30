class Game
  def self.create_board(tiles)
    size = Math.sqrt(tiles.length)
    board = Board.new(size.to_i)
    board.tiles = tiles
    board.move_count = board.count_moves
    board
  end

  def self.computer_move(board)
    unless board.game_over?
      if board.move_count.odd?
        computer = ComputerPlayer.new(board)
        computer.move
      end
    end
  end
end
