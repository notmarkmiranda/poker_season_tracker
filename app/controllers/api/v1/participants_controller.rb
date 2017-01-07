class Api::V1::ParticipantsController < Api::ApiController
  respond_to :json

  def index
    @participants = Participant.all.sort_by { |p| p.global_score }.reverse
  end

  def show
    @participant = Participant.find(params[:id])
  end

end
