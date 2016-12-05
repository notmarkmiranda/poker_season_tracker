class Api::V1::GamesController < Api::ApiController
  respond_to :json

  def index
    @games = Game.all.sort_by { |g| g.date }.reverse
  end

  def update
    @game    = Game.find(params[:id])
    @game.completed = true
    # @game.calculate_scores
    @game.save

    players = params[:_json]
    PlayerCreator.new(players, @game)
    render json: @game.to_json
  end
end
