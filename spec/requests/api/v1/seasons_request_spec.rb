require 'rails_helper'

RSpec.describe "Season API Endpoint
", type: :request do
  before do
    create_season
  end

  let(:first_response) {
    {
      "beginning" => "Nov 15, 2016",
      "end" => "Current Season",
      "game_count" => 1,
      "cumulative_pot" => 150,
      "season_leader" => "Andy B. | 1.15 points"
    }
  }

  let(:last_response) {
    {
      "beginning" => "Nov 05, 2015",
      "end" => "Ended: Oct 18, 2016",
      "game_count" => 12,
      "cumulative_pot" => 1230,
      "season_leader" => "Michael C. | 4.67 points"
    }
  }

  it "returns season details" do
    get '/api/v1/seasons'
    expect(JSON.parse(response.body).first).to eq(first_response)
    expect(JSON.parse(response.body).last).to eq(last_response)
  end

end
