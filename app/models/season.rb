class Season < ApplicationRecord
  has_many :games

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
    require "pry"; binding.pry
  end
end
