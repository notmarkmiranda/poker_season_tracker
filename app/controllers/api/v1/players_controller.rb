class Api::V1::PlayersController < Api::ApiController
  respond_to :json

  def index
    respond_with Player.all
  end

  def show
    respond_with Player.find(params[:id])
  end

end
