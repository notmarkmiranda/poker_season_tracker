class Participant < ApplicationRecord
  has_many :players
  has_many :games, through: :players

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :first_name, uniqueness: { scope: :last_name, case_sensitive: false }

  def display_name
    "#{first_name} #{last_name[0] + '.'}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def games_played
    games.count
  end

  def total_game_count
    evaluated_games.count
  end

  def evaluated_score
    if attendance_validation
      calculate_competition_score
    else
      0.0
    end
  end

  def total_points
    score = games.map do |game|
      game.players.find_by(participant_id: id).score
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
    (total_points / total_game_count * 100).floor / 100.0
  end

  def game_top_three_count
    players.where(finishing_place: [1,2,3]).where(game_id: evaluated_games.pluck(:id)).count
  end

  def overall_attendance
    (games.count / Game.count.to_f * 100).floor / 1.0
  end

  def percentage_attended
    (total_game_count / current_games_count * 100).floor / 1.0
  end

  def first_game
    date = games.sort_by { |game| game.date }.first.date
    date.strftime("%B %Y")
  end

  def overall_percentage(places)
    (players.where(finishing_place: places).count / games_played.to_f * 100).floor / 1.0
  end

  private

  def current_games_count
    Game.where(season_id: Season.current).count
  end

  def evaluated_games
    games.where(season_id: Season.current)
  end

  def calculate_competition_score
    top_5 = evaluated_games.map do |game|
      game.players.find_by(participant_id: id).score
    end
    skim(top_5)
  end

  def skim(arr)
    best = arr.sort.last(5)
    (best.reduce(:+) / best.count.to_f * 100).floor / 100.0
  end

  def attendance_validation
    evaluated_games.count / Game.where.not(season_id: 1).count.to_f > 0.30
  end
end
