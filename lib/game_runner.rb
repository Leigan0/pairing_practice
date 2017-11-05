require_relative 'player'
require_relative 'card'
require_relative 'game'

class GameRunner

INITIAL_HAND = 2 

attr_reader :game, :game_class,:player_class,:card_class
	
	def initialize(game_class: Game, player_class: Player, card_class: Card)
		@game_class = game_class
		@player_class = player_class
		@card_class = card_class
	end

	def play_game
		@game = @game_class.new(@player_class.new, @player_class.new,@card_class.new)
		@game.deal_game(INITIAL_HAND)
		@game.blackjack ? @game.winner : @game.deal_to_player
	end

	def end_game
		exit
	end

end