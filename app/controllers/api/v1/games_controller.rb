class Api::V1::GamesController < Api::ApiController
  respond_to :json

  def update
    require 'pry'; binding.pry
  end
end
