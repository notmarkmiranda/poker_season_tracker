# POKER SEASON TRACKER!

```
git clone git@github.com:notmarkmiranda/poker_season_tracker.git
cd poker_season_tracker
bundle
rake db:drop db:create db:migrate db:seed
rails s
```

Navigate to ```http://localhost:3000``` in your browser

### WHAT:
A Ruby on Rails, PostgreSQL, jQuery, and rspec tested app that tracks poker games by standard game data: # of players, buy-in amount, finishing place, and is divided into seasons.

### WHY:
I play in a monthly tournament-style poker game where we kept statistics on time played per round and top 3 finishers on sheets of paper. The question has been raised several times asking who the best player was. We were all at decent skill levels, but never had an answer to the question. I thought we could compile data and assign points based on tournament size, profitability, buy-in amount and total pot size.

### HOW:
This is the database schema:

![poker_schema.png](https://d17oy1vhnax1f7.cloudfront.net/items/0X1y0a2Z2l0P2C0J1q34/poker_schema_v2.png?v=1a0b642e)

A participant is anyone who shows up for a game. However, since not everyone shows up for every game a participant in a game is then an entry as a player. A player has a participant_id, a game_id, a finishing place, and any additional expenses(add-ons, rebuys, etc). Games can be divided up into seasons, primarily because of the turnover of people who eventually stop attending, and allows an incentive for people who are behind in the standings to still play.

All statistics (including score, wins, h2h nemesis, times placed) are calculated and not stored.

The scoring system uses many of the principles from this [site](http://www.homepokertourney.com/poker-league-points-systems.htm).

tldr version;
the formula is:
```
score = SQRT (n * b^2 / e) / (f + 1.0)
```

where
```
n = # of players
b = initial buy-in
e = total expense of the player in question (initial buy-in + rebuys + add-ons)
f = finishing place
```

An example of a 10 player tournament, with a $20 buy-in and no one rebuying or adding on:

|place | points awarded |
|------|----------------|
|1st   |7.07            |
|2nd   |4.71            |
|3rd   |3.54            |
|4th   |2.83            |
|5th   |2.36            |
|6th   |2.02            |
|7th   |1.77            |
|8th   |1.57            |
|9th   |1.41            |
|10th  |1.29            |

The overall premise is that each finishing place is exponentially harder to achieve as you approach 1st, a 10 person tournament is more difficult to finish 1st then a 5 person tournament, a higher buy-in would be harder to win than a lower buy-in, and players who don't rebuy or add-on are awarded more than those who do.

This is overall an early attempt at MVP and later iterations will get have more functionality. The current wishlist is:

```
- using time to win as a factor of score caclulation (winning faster is better than winning slower)
- an ios component to update places on an ios app at the poker table
- hand by hand wins & losses (maybe iteration 3)
```
