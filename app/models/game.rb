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

  def winner
    winner = Participant.joins(:players).where('players.game_id = ?', id).where('players.finishing_place = ?', 1).first
    "#{winner.first_name} #{winner.last_initial}"
  end

  def second_place
    second = Participant.joins(:players).where('players.game_id = ?', id).where('players.finishing_place = ?', 2).first
    "#{second.first_name} #{second.last_initial}"
  end
end