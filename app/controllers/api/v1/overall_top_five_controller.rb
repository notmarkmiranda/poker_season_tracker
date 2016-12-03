class Api::V1::OverallTopFiveController < Api::ApiController
  respond_to :json

  def index
    respond_with @participants = Participant.all.sort_by { |p| p.global_score }.reverse.take(5)
  end
end
