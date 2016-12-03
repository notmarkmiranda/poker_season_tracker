require 'rails_helper'

RSpec.describe "Top Five API Endpoint", type: :request do
  before do
    create_preseason
  end

  let(:first_response) {
    {
      "name" => 'Michael C.',
      "games" => 13,
      "score" => 7.342,
      "won" => 4,
      "place" => 6
    }
  }
  
  let(:last_response) {
    {
      "name" => 'Roman G.',
      "games" => 1,
      "score" => 0.242,
      "won" => 0,
      "place" => 0
    }
  }

  it "returns the overall top 5" do
    get '/api/v1/overall_rankings'
    expect(JSON.parse(response.body).first).to eq(first_response)
    expect(JSON.parse(response.body).last).to eq(last_response)
  end
end
