class Game
  attr_reader :board

  def initialize(tiles)
    @board = create_board(tiles)
  end

  def computer_move
    unless @board.game_over?
      if @board.move_count.odd?
        computer = ComputerPlayer.new(@board)
        computer.move
      end
    end
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
