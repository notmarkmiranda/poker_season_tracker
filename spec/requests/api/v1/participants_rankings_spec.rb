require 'rails_helper'

RSpec.describe "Overall Rankings API Endpoint", type: :request do
  before do
    create_season
  end

  let(:first_response) {
    {
      "name" => 'Michael C.',
      "games" => 13,
      "percent_attended" => 100.0,
      "score" => 7.342,
      "won" => 4,
      "percent_won" => 30.7,
      "place" => 6,
      "percent_placed" => 46.1

    }
  }

  let(:last_response) {
    {
      "name" => 'Roman G.',
      "games" => 1,
      "percent_attended" => 7.6,
      "score" => 0.242,
      "won" => 0,
      "percent_won" => 0,
      "place" => 0,
      "percent_placed" => 0
    }
  }

  it "returns the overall rankings" do
    get '/api/v1/participants'
    expect(JSON.parse(response.body).first).to eq(first_response)
    expect(JSON.parse(response.body).last).to eq(last_response)
  end

  

end
