class BoardsController < ApplicationController
  def new
  end

  def create
    @board = Board.new(params[:size].to_i)
    redirect_to board_path(@board.tiles)
  end

  def show
    @board = Game.create_board(params[:id])
    Game.computer_move(@board)
  end
end
