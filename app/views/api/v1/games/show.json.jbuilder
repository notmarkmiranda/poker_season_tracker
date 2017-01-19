json.id @game.id
json.buy_in @game.buy_in

json.players @game.sorted_players do |player|
  json.partial! 'player', player: player
end
