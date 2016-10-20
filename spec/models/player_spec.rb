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
end
