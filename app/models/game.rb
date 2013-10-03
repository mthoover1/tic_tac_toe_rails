class Game
  attr_reader :board

  def initialize(tiles)
    @board = create_board(tiles)
  end

  def computer_move
    computer = ComputerPlayer.new(@board)
    @board.update_tile(computer.get_move, computer.symbol)
  end

  private

  def create_board(tiles)
    size = Math.sqrt(tiles.length).to_i
    board = Board.new(size)
    board.tiles = tiles
    board.move_count = board.count_moves
    board
  end
end
