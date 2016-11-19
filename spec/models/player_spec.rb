require 'rails_helper'

RSpec.describe Player, type: :model do
  context "validations" do
    it { should belong_to(:participant) }
    it { should belong_to(:game) }

    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:game_id) }
    it { should validate_uniqueness_of(:finishing_place).scoped_to(:game_id) }

    it "scopes player can appear only once per game" do
      create(:player)
      should validate_uniqueness_of(:participant_id).scoped_to(:game_id)
    end
  end

  context "#player_score" do
    before do
      create_the_game
      ty = Participant.find_by(first_name: "Tyler")
      @tyler = Player.find_by(participant_id: ty.id)
      sc = Participant.find_by(first_name: "Scott")
      @scott = Player.find_by(participant_id: sc.id)
    end

    it "returns top and bottom scores" do
      expect(@tyler.get_score).to eq(4.74)
      expect(@scott.get_score).to eq(1.35)
    end
  end
end
