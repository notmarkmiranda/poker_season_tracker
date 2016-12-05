json.array!(@seasons) do |season|
  json.beginning season.beginning_of_season
  json.end season.end_of_season
  json.game_count season.game_count
  json.cumulative_pot season.cumulative_pot_size
  json.season_leader season.winner
end
