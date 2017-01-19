class Game < ApplicationRecord
  belongs_to :season
  has_many :players

  validates_uniqueness_of(:date)
  validates_presence_of(:date)
  validates_presence_of(:buy_in)
  validates_presence_of(:season_id)


  def calculate_scores
    players.each do |p|
      p.update(score: p.get_score)
    end
  end

  def player_count
    players.count
  end

  def formatted_date
    date.strftime("%b %d, %Y")
  end

  def full_formatted_date
    date.strftime("%B %d, %Y")
  end

  def winner
    winner = Participant.joins(:players).where('players.game_id = ?', id).where('players.finishing_place = ?', 1).first
    "#{winner.display_name}" if winner
  end

  def second_place
    second = Participant.joins(:players).where('players.game_id = ?', id).where('players.finishing_place = ?', 2).first
    "#{second.display_name}" if second
  end

  def find_player(id)
    players.find_by(participant_id: id)
  end

  def pot_size
    pot = player_count * buy_in
    pot + total_additional_expense if total_additional_expense
  end

  def self.biggest
    all.max_by { |game| game.pot_size }
  end

  def total_additional_expense
    players.pluck(:additional_expense).reduce(:+)
  end

  def sorted_players
    players.sort_by { |pl| pl.finishing_place }
  end

  def sorted_players_for_partial
    p = sorted_players
    p.map { |pl| [pl.full_name, pl.finishing_place] }
  end
end
