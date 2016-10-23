require 'rails_helper'

RSpec.describe Game, type: :model do
  context "validations" do
    it { should have_many(:players) }
    it { should belong_to(:season) }

    it { should validate_uniqueness_of(:date) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:buy_in) }
    it { should validate_presence_of(:season_id) }
  end

  it "#player_count" do
    create_the_game
    game = Game.last
    expect(game.player_count).to eq(6)
  end
end
