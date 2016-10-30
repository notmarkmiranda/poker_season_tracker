class Api::V1::ParticipantsController < Api::ApiController
  respond_to :json

  def index
    respond_with Participant.all
  end

  def show
    respond_with Participant.find(params[:id])
  end

end
