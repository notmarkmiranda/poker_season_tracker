class Api::V1::ParticipantsController < Api::ApiController
  respond_to :json

  def index
    respond_with @participants = Participant.all.sort_by { |p| p.global_score }.reverse
  end

  def show
    respond_with Participant.find(params[:id])
  end

end
