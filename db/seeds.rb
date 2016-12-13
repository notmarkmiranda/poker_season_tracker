# seasons
preseason = Season.create(active: false)
season    = Season.create

# participants
mark_h       = Participant.create(first_name: "Mark", last_name: "Harris")
john_m       = Participant.create(first_name: "Jonathan", last_name: "Mann")
mark_m       = Participant.create(first_name: "Mark", last_name: "Miranda")
chris        = Participant.create(first_name: "Chris", last_name: "Kampe")
andy         = Participant.create(first_name: "Andy", last_name: "Baum")
mike         = Participant.create(first_name: "Michael", last_name: "Cassano")
mike_g       = Participant.create(first_name: "Mike", last_name: "Green")
tyler        = Participant.create(first_name: "Tyler", last_name: "Merry")
scott        = Participant.create(first_name: "Scott", last_name: "Lukes")
jesse        = Participant.create(first_name: "Jesse", last_name: "Mortenson")
eric         = Participant.create(first_name: "Eric", last_name: "Starling")
alan         = Participant.create(first_name: "Alan", last_name: "Schindler")
henry        = Participant.create(first_name: "Henry", last_name: "Desroches")
roman        = Participant.create(first_name: "Roman", last_name: "Gavrilov")
shawn        = Participant.create(first_name: "Shawn", last_name: "Lyndon")
bobby        = Participant.create(first_name: "Bobby", last_name: "Yang")
zach         = Participant.create(first_name: "Zach", last_name: "Moore")
jeremy       = Participant.create(first_name: "Jeremy", last_name: "Balu")
julius       = Participant.create(first_name: "Julius", last_name: "Bogdan")


# START OF DECEMBER 12 GAME
game_121216 = Game.create!(date: Date.new(2016, 12, 12),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: season.id)
# jeremy
game_121216.players.create(
participant_id: jeremy.id,
finishing_place: 1)
# john_m
game_121216.players.create(
participant_id: john_m.id,
finishing_place: 2)
# alan
game_121216.players.create(
participant_id: alan.id,
finishing_place: 3,
additional_expense: 15)
# mike
game_121216.players.create(
participant_id: mike.id,
finishing_place: 4)
# scott
game_121216.players.create(
participant_id: scott.id,
finishing_place: 5)
# chris
game_121216.players.create(
participant_id: chris.id,
finishing_place: 6)
# mark_m
game_121216.players.create(
participant_id: mark_m.id,
finishing_place: 7)
# andy
game_121216.players.create(
participant_id: andy.id,
finishing_place: 8)
# tyler
game_121216.players.create(
participant_id: tyler.id,
finishing_place: 9)

# END OF DECEMBER 12 GAME

# START OF NOVEMBER 15 GAME
game_111516 = Game.create!(date: Date.new(2016, 11, 15),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: season.id)
# andy
game_111516.players.create(
participant_id: andy.id,
finishing_place: 1)
# jeremy
game_111516.players.create(
participant_id: jeremy.id,
finishing_place: 2)
# john_m
game_111516.players.create(
participant_id: john_m.id,
finishing_place: 3)
# mike
game_111516.players.create(
participant_id: mike.id,
finishing_place: 4,
additional_expense: 15)
# mark_h
game_111516.players.create(
participant_id: mark_h.id,
finishing_place: 5)
# mark_m
game_111516.players.create(
participant_id: mark_m.id,
finishing_place: 6)
# tyler
game_111516.players.create(
participant_id: tyler.id,
finishing_place: 7)
# julius
game_111516.players.create(
participant_id: julius.id,
finishing_place: 8)
# scott
game_111516.players.create(
participant_id: scott.id,
finishing_place: 9)

# END OF NOVEMBER 15 GAME


# START OF NOVEMBER 5 GAME - 3 - mike shawn
game_110515 = Game.create(date: Date.new(2015, 11, 5),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# mike
Player.create(participant_id: mike.id,
game_id: game_110515.id,
finishing_place: 1)
# shawn
Player.create(participant_id: shawn.id,
game_id: game_110515.id,
finishing_place: 2)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_110515.id,
finishing_place: 3)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_110515.id,
finishing_place: 4)
# bobby
Player.create(participant_id: bobby.id,
game_id: game_110515.id,
finishing_place: 5)
# zach
Player.create(participant_id: zach.id,
game_id: game_110515.id,
finishing_place: 6)

# END OF NOVEMBER 5 GAME


# START OF DECEMBER 7 GAME - 2 - mark tyler andy
game_120715 = Game.create(date: Date.new(2015, 12, 7),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_120715.id,
finishing_place: 1)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_120715.id,
finishing_place: 2)
# andy
Player.create(participant_id: andy.id,
game_id: game_120715.id,
finishing_place: 3)
# bobby
Player.create(participant_id: bobby.id,
game_id: game_120715.id,
finishing_place: 4)
# chris
Player.create(participant_id: chris.id,
game_id: game_120715.id,
finishing_place: 5)
# mike
Player.create(participant_id: mike.id,
game_id: game_120715.id,
finishing_place: 6)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_120715.id,
finishing_place: 7)
# zach
Player.create(participant_id: zach.id,
game_id: game_120715.id,
finishing_place: 7)

# END OF DECEMBER 7 GAME


# START OF JANUARY 5 GAME - 1 - andy mark chris
game_010516 = Game.create(date: Date.new(2016, 1, 5),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# andy
Player.create(participant_id: andy.id,
game_id: game_010516.id,
finishing_place: 1)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_010516.id,
finishing_place: 2)
# chris
Player.create(participant_id: chris.id,
game_id: game_010516.id,
finishing_place: 3)
# bobby
Player.create(participant_id: bobby.id,
game_id: game_010516.id,
finishing_place: 4)
# shawn
Player.create(participant_id: shawn.id,
game_id: game_010516.id,
finishing_place: 5)
# mike
Player.create(participant_id: mike.id,
game_id: game_010516.id,
finishing_place: 6)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_010516.id,
finishing_place: 7)


# END OF JANUARY 5 GAME


# START OF FEBRUARY 15 GAME - 7 - shawn mark zach
game_021516 = Game.create(date: Date.new(2016, 2, 15),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# shawn
Player.create(participant_id: shawn.id,
game_id: game_021516.id,
finishing_place: 1)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_021516.id,
finishing_place: 2)
# zach
Player.create(participant_id: zach.id,
game_id: game_021516.id,
finishing_place: 3)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_021516.id,
finishing_place: 4)
# chris
Player.create(participant_id: chris.id,
game_id: game_021516.id,
finishing_place: 5)
# mike
Player.create(participant_id: mike.id,
game_id: game_021516.id,
finishing_place: 6)

# END OF FEBRUARY 15 GAME


# START OF MARCH 15 GAME - 6 - mike shaw andy
game_031516 = Game.create(date: Date.new(2016, 3, 15),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# mike
Player.create(participant_id: mike.id,
game_id: game_031516.id,
finishing_place: 1)
# shawn
Player.create(participant_id: shawn.id,
game_id: game_031516.id,
finishing_place: 2)
# andy
Player.create(participant_id: andy.id,
game_id: game_031516.id,
finishing_place: 3)
# bobby
Player.create(participant_id: bobby.id,
game_id: game_031516.id,
finishing_place: 4)
# chris
Player.create(participant_id: chris.id,
game_id: game_031516.id,
finishing_place: 5)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_031516.id,
finishing_place: 6)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_031516.id,
finishing_place: 7)

# END OF MARCH 15 GAME


# START OF APRIL 5 GAME - 5 - andy john shawn
game_040516 = Game.create(date: Date.new(2016, 4, 5),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# andy
Player.create(participant_id: andy.id,
game_id: game_040516.id,
finishing_place: 1)
# john_m
Player.create(participant_id: john_m.id,
game_id: game_040516.id,
finishing_place: 2)
# shawn
Player.create(participant_id: shawn.id,
game_id: game_040516.id,
finishing_place: 3)
# zach
Player.create(participant_id: zach.id,
game_id: game_040516.id,
finishing_place: 4)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_040516.id,
finishing_place: 5)
# mike
Player.create(participant_id: mike.id,
game_id: game_040516.id,
finishing_place: 6)
# bobby
Player.create(participant_id: bobby.id,
game_id: game_040516.id,
finishing_place: 7)

# END OF APRIL 5 GAME


# START OF MAY 11 GAME - 4 - chris eric mike g
game_051116 = Game.create(date: Date.new(2016, 5, 11),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# chris
Player.create(participant_id: chris.id,
game_id: game_051116.id,
finishing_place: 1)
# eric
Player.create(participant_id: eric.id,
game_id: game_051116.id,
finishing_place: 2)
# mike_g
Player.create(participant_id: mike_g.id,
game_id: game_051116.id,
finishing_place: 3)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_051116.id,
finishing_place: 4)
# alan
Player.create(participant_id: alan.id,
game_id: game_051116.id,
finishing_place: 5)
# henry
Player.create(participant_id: henry.id,
game_id: game_051116.id,
finishing_place: 6)
# mike
Player.create(participant_id: mike.id,
game_id: game_051116.id,
finishing_place: 7)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_051116.id,
finishing_place: 8)

# END OF MAY 11 GAME


# START OF JUNE 13 GAME - 3 - tyler mike chris
game_061316 = Game.create(date: Date.new(2016, 6, 13),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_061316.id,
finishing_place: 1)
# mike
Player.create(participant_id: mike.id,
game_id: game_061316.id,
finishing_place: 2)
# chris
Player.create(participant_id: chris.id,
game_id: game_061316.id,
finishing_place: 3)
# mike_g
Player.create(participant_id: mike_g.id,
game_id: game_061316.id,
finishing_place: 4)
# alan
Player.create(participant_id: alan.id,
game_id: game_061316.id,
finishing_place: 5)
# andy
Player.create(participant_id: andy.id,
game_id: game_061316.id,
finishing_place: 6)
# henry
Player.create(participant_id: henry.id,
game_id: game_061316.id,
finishing_place: 7)
# roman
Player.create(participant_id: roman.id,
game_id: game_061316.id,
finishing_place: 8)
# END OF JUNE 13 GAME


# START OF JULY 13 GAME - 2
game_071316 = Game.create(date: Date.new(2016, 7, 13),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# mike
Player.create(participant_id: mike.id,
game_id: game_071316.id,
finishing_place: 1)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_071316.id,
finishing_place: 2)
# jesse
Player.create(participant_id: jesse.id,
game_id: game_071316.id,
finishing_place: 3)
# andy
Player.create(participant_id: andy.id,
game_id: game_071316.id,
finishing_place: 4)
# eric
Player.create(participant_id: eric.id,
game_id: game_071316.id,
finishing_place: 5)
# john_m
Player.create(participant_id: john_m.id,
game_id: game_071316.id,
finishing_place: 6)
# END OF JULY 13 GAME

# START OF AUGUST 16TH GAME
game_081616 = Game.create(date: Date.new(2016, 8, 16),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# chris
Player.create(participant_id: chris.id,
game_id: game_081616.id,
finishing_place: 1)
# andy
Player.create(participant_id: andy.id,
game_id: game_081616.id,
finishing_place: 2)
# mike_g
Player.create(participant_id: mike_g.id,
game_id: game_081616.id,
finishing_place: 3)
# mark_m
Player.create(participant_id: mark_m.id,
game_id: game_081616.id,
finishing_place: 4)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_081616.id,
finishing_place: 5)
# mike
Player.create(participant_id: mike.id,
game_id: game_081616.id,
finishing_place: 6)
# scott
Player.create(participant_id: scott.id,
game_id: game_081616.id,
finishing_place: 7)
# END OF AUGUST 16TH GAME

# START OF SEPTEMBER 21ST GAME
game_092116 = Game.create(date: Date.new(2016, 9, 21),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# mike
Player.create(participant_id: mike.id,
game_id: game_092116.id,
finishing_place: 1)
# mark
Player.create(participant_id: mark_m.id,
game_id: game_092116.id,
finishing_place: 2)
# chris
Player.create(participant_id: chris.id,
game_id: game_092116.id,
finishing_place: 3)
# tyler
Player.create(participant_id: tyler.id,
game_id: game_092116.id,
finishing_place: 4)
# andy
Player.create(participant_id: andy.id,
game_id: game_092116.id,
finishing_place: 5)
# mark_h
Player.create(participant_id: mark_h.id,
game_id: game_092116.id,
finishing_place: 6)
# john_m
Player.create(participant_id: john_m.id,
game_id: game_092116.id,
finishing_place: 7)
# END OF SEPTEMBER 21ST GAME


# START OF OCTOBER 18th GAME
game = Game.create(date: Date.new(2016, 10, 18),
buy_in: 15,
completed: true,
time_played: "03:30:00",
season_id: preseason.id)
# tyler
Player.create(participant_id: tyler.id,
game_id: game.id,
finishing_place: 1)
# mike
Player.create(participant_id: mike.id,
game_id: game.id,
finishing_place: 2)
# mark_m
Player.create(participant_id: mark_m.id,
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
# END OF OCTOBER 18th GAME

# User
User.create(email: 'markmiranda51@gmail.com', password: 'password')


# Calculate game scores
Game.all.each do |g|
  g.calculate_scores
end
