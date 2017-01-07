require 'rails_helper'

RSpec.describe "Players API Endpoint", type: :request do
  before do
    create_season
  end

  let(:first_response) {
    { "id"=>1,
      "participant_id"=>5,
      "game_id"=>1,
      "finishing_place"=>1,
      "created_at"=>"2017-01-07T04:34:55.711Z",
      "updated_at"=>"2017-01-07T04:34:56.581Z",
      "additional_expense"=>0, "score"=>5.8
    }
  }

  it "GET#index" do
    player1 = Player.first
    player2 = Player.last
    get '/api/v1/players'

    expect(JSON.parse(response.body).first["participant_id"]).to eq(player1.participant_id)
    expect(JSON.parse(response.body).first["game_id"]).to eq(player1.game_id)
    expect(JSON.parse(response.body).first["finishing_place"]).to eq(player1.finishing_place)
    expect(JSON.parse(response.body).first["score"]).to eq(player1.score)
    expect(JSON.parse(response.body).last["participant_id"]).to eq(player2.participant_id)
    expect(JSON.parse(response.body).last["game_id"]).to eq(player2.game_id)
    expect(JSON.parse(response.body).last["finishing_place"]).to eq(player2.finishing_place)
    expect(JSON.parse(response.body).last["score"]).to eq(player2.score)
  end

  it "GET#show" do
    player = Player.last
    get "/api/v1/players/#{player.id}"

    expect(JSON.parse(response.body)["participant_id"]).to eq(player.participant_id)
    expect(JSON.parse(response.body)["game_id"]).to eq(player.game_id)
    expect(JSON.parse(response.body)["finishing_place"]).to eq(player.finishing_place)
    expect(JSON.parse(response.body)["score"]).to eq(player.score)
  end
end
