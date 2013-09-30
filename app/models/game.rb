class Game
  attr_reader :board

  def initialize(tiles)
    @board = create_board(tiles)
  end

  def create_board(tiles)
    size = Math.sqrt(tiles.length)
    board = Board.new(size.to_i)
    board.tiles = tiles
    board.move_count = board.count_moves
    board
  end

  def computer_move
    unless @board.game_over?
      if @board.move_count.odd?
        computer = ComputerPlayer.new(@board)
        computer.move
      end
    end
  end
end
