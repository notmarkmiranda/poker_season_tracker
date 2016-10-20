class Game < ApplicationRecord
  belongs_to :season
  has_many :players
  
  validates_uniqueness_of(:date)
  validates_presence_of(:date)
  validates_presence_of(:buy_in)
  validates_presence_of(:season_id)
end
