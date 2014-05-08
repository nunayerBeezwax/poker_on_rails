class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.save
    redirect_to :back
  end
end
