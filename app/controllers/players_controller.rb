class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    if Player.exists?(params[:id])
      @player = Player.find(params[:id])
    else
      redirect_to error_404_path
    end
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.new(player_params)
    if player.save
      redirect_to player
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player
    end
  end

  private

  def player_params
    params.require(:player).permit(:participant_id, :game_id, :finishing_place, :total_expense)
  end
end
