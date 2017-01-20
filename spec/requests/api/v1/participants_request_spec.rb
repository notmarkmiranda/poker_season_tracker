require 'rails_helper'

RSpec.describe "Overall Rankings API Endpoint", type: :request do
  before do
    create_season
  end

  let(:first_response) {
    {
      "id" => Participant.find_by(last_name: "Cassano").id,
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
      "id" => Participant.find_by(first_name: "Roman").id,
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

  let(:created_response) {
    {
      "name" => 'John D.',
      "games" => 0,
      "percent_attended" => 0,
      "score" => 0,
      "won" => 0,
      "percent_won" => 0,
      "place" => 0,
      "percent_placed" => 0
    }
  }

  let(:updated_response) {
    {
      "id" => Participant.find_by(last_name: "Cassano").id,
      "name" => 'Mike C.',
      "games" => 13,
      "percent_attended" => 100.0,
      "score" => 7.342,
      "won" => 4,
      "percent_won" => 30.7,
      "place" => 6,
      "percent_placed" => 46.1

    }
  }

  it "GET#index" do
    get '/api/v1/participants'
    expect(JSON.parse(response.body).first).to eq(first_response)
    expect(JSON.parse(response.body).last).to eq(last_response)
  end

  it "GET#show" do
    p = Participant.find_by(last_name: "Cassano")
    get "/api/v1/participants/#{p.id}"
    expect(JSON.parse(response.body)).to eq(first_response)
  end

  context "yup" do

    before do
      post '/api/v1/participants', params: { participant: { first_name: 'john', last_name: 'Doe' } }
    end

    it "POST#create" do
      expect(JSON.parse(response.body)).to include(created_response)
    end

    it "DELETE#destroy" do
      p = Participant.find_by(last_name: "Doe")
      delete "/api/v1/participants/#{p.id}"
      expect(JSON.parse(response.body)).to_not eq(created_response)
    end
  end

  it "PATCH#update" do
    p = Participant.find_by(last_name: "Cassano")
    patch "/api/v1/participants/#{p.id}", params: { participant: { first_name: 'Mike' } }
    expect(JSON.parse(response.body)).to eq(updated_response)
  end


end
