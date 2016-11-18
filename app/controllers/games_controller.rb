class GamesController < ApplicationController
  def index
    @games = Game.all.sort_by { |g| g.date }.reverse
  end

  def show
    if Game.exists?(params[:id])
      @game = Game.find(params[:id])
      @players = @game.players.sort_by { |p| p.finishing_place }
    else
      redirect_to error_404_path
    end
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    if game.save
      redirect_to edit_game_path(game.id)
    else
      render :new
    end
  end

  def edit
    if Game.exists?(params[:id])
      @game = Game.find(params[:id])
    else
      redirect_to error_404_path
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:date, :buy_in, :time_played, :season_id)
  end
end
