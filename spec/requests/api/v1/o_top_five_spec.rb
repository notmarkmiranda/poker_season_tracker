require 'rails_helper'

RSpec.describe "Top Five API Endpoint", type: :request do
    before do
      create_preseason
    end

    let(:expected_response) {
      [
        {
          "name" => 'Michael C.',
          "games" => 13,
          "score" => 7.342,
          "won" => 4,
          "place" => 6
        },
        {
          "name" => 'Andy B.',
          "games" => 10,
          "score" => 6.322,
          "won" => 3,
          "place" => 6
        },
        {
          "name" => 'Tyler M.',
          "games" => 13,
          "score" => 6.244,
          "won" => 2,
          "place" =>4
        },
        {
          "name" => 'Mark M.',
          "games" => 10,
          "score" => 5.436,
          "won" => 1,
          "place" => 6
        },
        {
          "name" => 'Chris K.',
          "games" => 9,
          "score" => 5.0,
          "won" => 2,
          "place" => 5
        },
      ]
    }
    it "returns the overall top 5" do
      get '/api/v1/overall_top_five'
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
end
