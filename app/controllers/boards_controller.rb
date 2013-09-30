class BoardsController < ApplicationController
  def new
  end

  def create
    @board = Board.new(params[:size].to_i)
    redirect_to board_path(@board.tiles)
  end

  def show
    game = Game.new(params[:id])
    game.computer_move
    @board = game.board
  end
end
