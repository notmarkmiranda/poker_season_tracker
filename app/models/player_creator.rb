class PlayerCreator
  def initialize(players, game)
    @players = players
    @game    = game
    update_players
  end

  def update_players
    @players.each_with_index do |player, index|
      additional_expense = calculate_buy_back(player)
      participant        = find_or_create_participant(player)
      @game.players.create(participant: participant, finishing_place: (index + 1), additional_expense: additional_expense)
    end
  end

  def calculate_buy_back(player)
    if player[:buyBack] == true
      @game.buy_in
    else
      0
    end
  end

  def find_or_create_participant(player)
    if player[:id] == 0
      create_new_participant(player)
    else
      Participant.find(player[:id])
    end
  end

  def create_new_participant(player)
    first_name = player[:name].split(" ").first
    last_name  = player[:name].split(" ").last
    Participant.create(first_name: first_name, last_name: last_name)
  end
end
