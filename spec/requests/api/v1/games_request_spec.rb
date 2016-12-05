require 'rails_helper'

RSpec.describe "Games API Endpoint" do
  
  before do
    create_season
    @recent_game = Game.find_by(date: Date.new(2016, 11, 15))
    @first_game = Game.find_by(date: Date.new(2015, 11, 05))
  end

  let(:first_response) {
    {
      "season_number" => @recent_game.season.id,
      "date" => @recent_game.full_formatted_date,
      "players" => @recent_game.player_count,
      "buy_in" => @recent_game.buy_in,
      "pot_size" => @recent_game.pot_size,
      "winner" => @recent_game.winner,
      "runner_up" => @recent_game.second_place
    }
  }

  let(:last_response) {
    {
      "season_number" => @first_game.season.id,
      "date" => @first_game.full_formatted_date,
      "players" => @first_game.player_count,
      "buy_in" => @first_game.buy_in,
      "pot_size" => @first_game.pot_size,
      "winner" => @first_game.winner,
      "runner_up" => @first_game.second_place
    }
  }


  it "returns the games in descending date order" do
    get '/api/v1/games'
    expect(JSON.parse(response.body).first).to eq(first_response)
    expect(JSON.parse(response.body).last).to eq(last_response)
  end
end
