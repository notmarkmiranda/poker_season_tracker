class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all.sort_by { |p| p.evaluated_score }.reverse
  end

  def show
    if Participant.exists?(id: params[:id])
      @participant = Participant.find(params[:id])
    else
      redirect_to error_404_path
    end
  end

  def new
    @participant = Participant.new
  end

  def create
    participant = Participant.new(participant_params)
    if participant.save
      redirect_to participant
    else
      render :new
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params)
      redirect_to @participant
    else
      render :edit
    end
  end

  def destroy
    Participant.find(params[:id]).destroy
    redirect_to participants_path
  end

  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name)
  end
end
