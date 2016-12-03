class Api::V1::OverallRankingsController < Api::ApiController
  respond_to :json

  def index
    respond_with @participants = Participant.all.sort_by { |p| p.global_score }.reverse
  end
end
