class Nemesis < ApplicationRecord
  belongs_to :nemesis, class_name: "Participant"
  belongs_to :stalker, class_name: "Participant"
  validates :nemesis_id, presence: true
  validates :stalker_id, presence: true
end
