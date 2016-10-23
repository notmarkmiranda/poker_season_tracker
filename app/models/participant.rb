class Participant < ApplicationRecord
  has_many :players
  has_many :games, through: :players

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :first_name, uniqueness: { scope: :last_name, case_sensitive: false }

  def last_initial
    last_name[0] + '.'
  end

  def display_name
    "#{first_name} #{last_initial}"
  end

  def total_game_count
    games.count
  end

  def total_score
    overall_game_count = Game.count
    score = games.map do |game|
      (total_game_count / overall_game_count.to_f) > 0.50 ? game.players.find_by(participant_id: id).score : 0
    end.reduce(:+)
    (score * 100).floor / 100.0
  end

  def actual_score
    score = games.map do |game|
      game.players.find_by(participant_id: id).score
    end.reduce(:+)
    (score * 100).floor / 100.0
  end

  def average_score
    (total_score / total_game_count * 100).floor / 100.0
  end

  def game_top_three_count
    players.where(finishing_place: [1,2,3]).count
  end

  def percentage_attended
    (total_game_count / Game.count.to_f * 100).floor / 1.0
  end

end
