class Api::V1::PlayersController < Api::ApiController
  respond_to :json

  def index
    respond_with Player.all
  end

  def show
    respond_with Player.find(params[:id])
  end

  def create
    player = Player.create(player_params)
    respond_with player
  end

  private
  def player_params
    params.permit(:participant_id, :game_id, :finishing_place, :additional_expense)
  end
end
