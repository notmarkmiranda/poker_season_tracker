
json.array!(@participants) do |participant|
  json.name participant.display_name
  json.games participant.games.count
  json.score participant.global_score
  json.won participant.global_win_count
  json.place participant.global_game_top_three_count
end
