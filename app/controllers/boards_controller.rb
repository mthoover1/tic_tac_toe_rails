class BoardsController < ApplicationController
  def new
  end

  def create
    @board = Board.new(params[:size].to_i)
    # params.merge(:tiles => @board.tiles.split(""))
    # params[:tiles] = @board.tiles.split("")
    redirect_to board_path(@board.tiles) #, tiles: @board.tiles.split(""))
  end

  def show
    # tiles = params[:tiles].flatten.join   # may not have to flatten
    # size = Math.sqrt(tiles.length).to_i
    # @board = Board.new(size)
    # @board.tiles = tiles
    # @board.move_count = @board.count_moves

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
  end

  def edit

  end
end
