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

  def total_games_count
    games.count
  end

  def evaluated_game_count
    evaluated_games.count
  end

  def previous_game_count
    total_games_count - evaluated_game_count
  end

  def evaluated_score
    if attendance_validation
      calculate_competition_score("evaluated_games")
    else
      0.0
    end
  end

  def previous_score
    if attendance_validation
      calculate_competition_score("previous_evaluated_games")
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

  def average_score
    (total_points / total_games_count * 100).floor / 100.0
  end

  def game_top_three_count
    players.where(finishing_place: [1,2,3]).where(game_id: evaluated_games.pluck(:id)).count
  end

  def overall_attendance
    (games.count / Game.count.to_f * 100).floor / 1.0
  end

  def current_percentage_attended
    (evaluated_game_count / current_games_count * 100).floor / 1.0
  end

  def previous_percentage_attended
    (previous_game_count / previous_games_count.to_f * 100).floor / 1.0
  end

  def first_game
    date = games.sort_by { |game| game.date }.first.date
    date.strftime("%B %Y")
  end

  def overall_percentage(places)
    (players.where(finishing_place: places).count / total_games_count.to_f * 100).floor / 1.0
  end

  def evaluated_overall_percentage(places)
    won   = players.where(finishing_place: places).where(game_id: current_games.pluck(:id)).count
    total = evaluated_game_count.to_f
    total == 0.0 ? 0.0 : (won / total * 1000).floor / 10.0
  end

  def previous_overall_percentage(places)
    won   = players.where(finishing_place: places).where(game_id: previous_games.pluck(:id)).count
    total = previous_game_count.to_f
    total == 0.0 ? 0.0 : (won / total * 1000).floor / 10.0
  end

  def evaluated_games
    games.where(season_id: Season.current).sort_by { |game| game.date }.reverse
  end

  def previous_evaluated_games
    games.where.not(season_id: Season.current).sort_by { |game| game.date }.reverse
  end

  private

  def current_games
    Game.where(season_id: Season.current)
  end

  def current_games_count
    current_games.count
  end

  def previous_games
    Game.where.not(season_id: Season.current)
  end

  def previous_games_count
    previous_games.count
  end

  def calculate_competition_score(games)
    top_5 = self.send(games).map do |game|
      game.players.find_by(participant_id: id).score
    end
    skim(top_5)
  end

  def skim(arr)
    best = arr.sort.last(5)
    (best.reduce(:+) / best.count.to_f * 1000).floor / 1000.0
  end

  def attendance_validation
    evaluated_games.count / Game.where.not(season_id: 1).count.to_f > 0.30
  end
end
