class Game < ApplicationRecord
  belongs_to :season
  has_many :players

  validates_uniqueness_of(:date)
  validates_presence_of(:date)
  validates_presence_of(:buy_in)
  validates_presence_of(:season_id)

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
    "#{winner.display_name}"
  end

  def second_place
    second = Participant.joins(:players).where('players.game_id = ?', id).where('players.finishing_place = ?', 2).first
    "#{second.display_name}"
  end

  def find_player(id)
    players.find_by(participant_id: id)
  end

  def pot_size
    player_count * buy_in + total_additional_expense
  end

  def total_additional_expense
    players.pluck(:additional_expense).reduce(:+)
  end
end
