class BoardsController < ApplicationController
  def new
  end

  def create
    @board = Board.new(params[:size].to_i)
    redirect_to board_path(@board.tiles)
  end

  def show
    game = Game.new(params[:id])
    @board = game.board
    game.computer_move if @board.move_count.odd? && !@board.game_over?
  end
end
