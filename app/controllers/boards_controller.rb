class BoardsController < ApplicationController
  def new
  end

  def create
    @board = Board.new(params[:size].to_i)
    redirect_to board_path(@board.tiles)
  end

  def show
    @size = Math.sqrt(params[:id].length)
    @board = Board.new(@size.to_i)
    @board.tiles = params[:id]
    @board.move_count = @board.count_moves

    unless @board.won? || @board.tied? || @board.future_cats_game?
      if @board.move_count.odd?
        computer = ComputerPlayer.new(@board)
        computer.move
      end
    end


    # @game = GameController.new(Interface.new, @board)
    # @board.update(5, "X")
    # @board.update(9, "O")
  end

  def edit

  end
end
