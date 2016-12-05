json.array!(@games) do |game|
  json.season_number game.season.id
  json.date game.full_formatted_date
  json.players game.player_count
  json.buy_in game.buy_in
  json.pot_size game.pot_size
  json.winner game.winner
  json.runner_up game.second_place
end
