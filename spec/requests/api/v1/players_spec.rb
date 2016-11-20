require 'rails_helper'

RSpec.describe "POST /api/v1/players" do
  it "returns a new player" do
    participant = create(:participant)
    game        = create(:game)

    post "/api/v1/players?participant_id=#{participant.id}&game_id=#{game.id}"

    expect(json_body["participant_id"]).to eq(participant.id)
    expect(json_body["game_id"]).to eq(game.id)
    expect(Player.last.participant_id).to eq(participant.id)
  end
end
