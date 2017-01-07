class Api::V1::ParticipantsController < Api::ApiController
  respond_to :json

  def index
    render partial: '/api/v1/participants/participants', locals: { participants: Participant.all.sort_by { |p| p.global_score }.reverse }
  end

  def show
    participant = Participant.find(params[:id])
    render partial: '/api/v1/participants/participant', locals: { participant: participant }
  end

  def create
    participant = Participant.new(participant_params)
    render partial: '/api/v1/participants/participant', locals: { participant: participant } if participant.save
  end

  def update
    participant = Participant.find(params[:id])
    render partial: '/api/v1/participants/participant', locals: { participant: participant } if participant.update(participant_params)
  end

  def destroy
    participant = Participant.find(params[:id])
    if participant.delete
      render partial: '/api/v1/participants/participants', locals: { participants: Participant.all.sort_by { |p| p.global_score }.reverse }
    else
    end
  end



  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name)
  end

end
