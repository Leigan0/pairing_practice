
# Beat the dealer 21  



## Basic rules
* Numbered cards are their point values
* Jack, Queen and King count as 10
* Ace counts as 11
* Black Jack refers to 21 being reached with two cards only

## User stories

* As a player and dealer, so I can play the game, I need to be given two cards from a deck
* As player of the game, I need to know my score, so I can win the game
* As a player, I need to know if the dealer has black jack, so I know the game is over
* As a player, so the game can continue, I need to be able to draw cards from the deck
* As a player, so I know what move to make next, I need to know the score of my hand
* As a player, so I know if I have lost the game, a score of 21 or over should end the game
* As a player, so I reduce my chances of going above 21, I should stop drawing cards from the deck when my total is above 17
* As a dealer, so I know when to play, I need to know when the player has stopped drawing cards from the deck
* As a dealer, so I know reduce my chances of losing, I should stop drawing cards once my total is higher than the players
* As a dealer, so I know if I have lost, a score of 21 or over should end the game
* As players, so we know who has won, the game should confirm which player has won


## Usage

### Getting started
 * git clone https://github.com/Leigan0/beat-the-dealer-21
 * cd beat_the_dealer_21
 * install bundle
 * bundle install

#### Running Tests
rspec

#### Technologies used
rspec
ruby
