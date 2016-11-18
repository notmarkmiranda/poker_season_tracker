require 'simplecov'
SimpleCov.start('rails') do
  add_filter 'channels'
  add_filter 'helpers'
  add_filter 'jobs'
  add_filter 'mailers'
end
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = false
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def create_the_game
  mark  = Participant.create(first_name: "Mark", last_name: "Miranda")
  chris = Participant.create(first_name: "Chris", last_name: "Kampe")
  andy  = Participant.create(first_name: "Andy", last_name: "Baum")
  mike  = Participant.create(first_name: "Michael", last_name: "Cassano")
  tyler = Participant.create(first_name: "Tyler", last_name: "Merry")
  scott = Participant.create(first_name: "Scott", last_name: "Lukes")

  season = Season.create
  game = Game.create(date: Date.new(2016, 10, 18),
    buy_in: 15,
    time_played: "03:30:00",
    season_id: season.id)

  # tyler
  Player.create(participant_id: tyler.id,
    game_id: game.id,
    finishing_place: 1)

  # mike
  Player.create(participant_id: mike.id,
    game_id: game.id,
    finishing_place: 2)

  # mark
  Player.create(participant_id: mark.id,
    game_id: game.id,
    finishing_place: 3)

  # andy
  Player.create(participant_id: andy.id,
    game_id: game.id,
    finishing_place: 4)

  # chris
  Player.create(participant_id: chris.id,
    game_id: game.id,
    finishing_place: 5)

  # scott
  Player.create(participant_id: scott.id,
    game_id: game.id,
    finishing_place: 6)

end
