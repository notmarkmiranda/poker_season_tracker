class Season < ApplicationRecord
  has_many :games
  has_many :players, through: :games
  has_many :participants, through: :players

  def beginning_of_season
    games.min_by { |game| game.date }.date.strftime("%b %d, %Y")
  end

  def end_of_season
    if !active
      games.max_by { |game| game.date }.date.strftime("%b %d, %Y")
    else
      "Current Season"
    end
  end

  def game_count
    games.count
  end

  def winner
    standings = {}
    players.each do |player|
      check_for_player(standings, player)
      standings[player.participant_id] << player.score
    end
    parse_standings(standings)
  end

  def self.current
    Season.find_by(active: true).id
  end

  def player_count
    participants.uniq.count
  end

  def cumulative_pot_size
    games.map do |g|
      g.pot_size
    end.reduce(:+)
  end

  private

  def parse_standings(standings)
    top = {}
    standings.each do |id, scores|
      eligible_scores = scores.sort.last(5)
      top[id] = ((eligible_scores.reduce(:+) / eligible_scores.count) * 100).floor / 100.0
    end
    format_winner(top)
  end

  def format_winner(top)
    win = top.max_by{ |k,v| v }
    winner = Participant.find(win[0])
    "#{winner.display_name} | #{win[1]}"
  end

  def check_for_player(standings, player)
    if !standings[player.participant_id]
      standings[player.participant_id] = []
    end
    standings
  end
end
