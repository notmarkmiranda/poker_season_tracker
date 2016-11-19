require 'rails_helper'

RSpec.describe Nemesis, type: :model do
  context "validations" do
    it { should belong_to(:nemesis) }
    it { should belong_to(:stalker) }
    it { should validate_presence_of(:nemesis_id) }
    it { should validate_presence_of(:stalker_id) }
  end
end
