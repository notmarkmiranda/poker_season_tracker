require 'rails_helper'

RSpec.describe Participant, type: :model do
  context "validations" do
    it { should have_many(:players) }
    it { should have_many(:games).through(:players) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name).case_insensitive }

    it { should have_many(:nemesis_relationships) }
    it { should have_many(:nemeses).through(:nemesis_relationships) }
    it { should have_many(:stalker_relationships) }
    it { should have_many(:stalkers).through(:stalker_relationships) }

  end

  it "#evaluated_game_count" do
    player = create(:player)
    participant = player.participant
    expect(participant.evaluated_game_count).to eq(1)
  end

  xit "#evaluated_game_count - more than 1" do
    player = create(:player)
    participant = player.participant
    game1 = create(:game, date: Date.today)
    create(:player, participant_id: player.participant_id, game_id: game1.id)
    game2 = create(:game, date: Date.today + 1)
    create(:player, participant_id: player.participant_id, game_id: game2.id)

    expect(participant.evaluated_game_count).to eq(3)
  end

  it "#total_points" do
    create_the_game
    tyler = Participant.find_by(first_name: "Tyler")
    mark  = Participant.find_by(first_name: "Mark")
    scott = Participant.find_by(first_name: "Scott")
    expect(tyler.total_points).to eq(4.74)
    expect(mark.total_points).to eq(2.37)
    expect(scott.total_points).to eq(1.35)
  end

  it "#average_score" do
    create_the_game
    tyler = Participant.find_by(first_name: "Tyler")
    expect(tyler.average_score).to eq(4.74)
  end
end
