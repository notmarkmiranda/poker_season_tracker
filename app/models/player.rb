class Player < ApplicationRecord
  belongs_to :participant
  belongs_to :game

  validates_presence_of :participant_id
  validates_presence_of :game_id
  validates_uniqueness_of :participant_id, scope: :game_id
  validates_uniqueness_of :finishing_place, scope: :game_id

  # def score
  #   score = score_math
  #   (score * 100).floor / 100.0
  # end
  def full_name
    participant.full_name
  end

  def get_score
    score = score_math
    (score * 100).floor / 100.0
  end

  def nemesis
    if finishing_place == 1
      game.second_place
    elsif finishing_place == 2
      game.winner
    else
      "N/A"
    end
  end

  private

  def score_math
    player_count  = game.player_count
    buy_in        = game.buy_in
    total_expense = buy_in + additional_expense
    numerator     = (player_count * buy_in ** 2 / total_expense)
    denominator   = finishing_place + 1.0
    Math.sqrt(numerator) / (denominator)
  end

end
