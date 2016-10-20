class Player < ApplicationRecord
  belongs_to :participant
  belongs_to :game
  
  validates_presence_of :participant_id
  validates_presence_of :game_id
  validates_uniqueness_of :participant_id, scope: :game_id
  validates_uniqueness_of :finishing_place, scope: :game_id
end
