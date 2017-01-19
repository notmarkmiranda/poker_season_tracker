class Api::V1::PlayersController < Api::ApiController
  respond_to :json

  def index
    respond_with Player.all
  end

  def show
    respond_with Player.find(params[:id])
  end

  def create
    player = Player.new(player_params!)
    if player.save
      render json: player
    else
      render json: { message: player.errors.full_messages.join(", ")}
    end
  end

  private

  def player_params!
    params.require(:player).permit(:game_id, :participant_id, :finishing_place)
  end

end
