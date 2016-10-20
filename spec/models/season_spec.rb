require 'rails_helper'

RSpec.describe Season, type: :model do
  context "validations" do
    it { should have_many(:games) }
  end
end
