require_relative 'player'
require_relative 'card'
require_relative 'game'

class GameRunner

INITIAL_HAND = 2 

	def play_game
		@game = Game.new(Player.new, Player.new,Card)
		@game.deal_game(INITIAL_HAND)
		blackjack ? @game.winner : @game.player_turn
	end
	
end