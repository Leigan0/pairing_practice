require_relative 'player'
require_relative 'card'

class Game 

	attr_reader :player, :dealer, :card_class
	BLACKJACK = 21 

	def initialize(player_class, card_class)
		@player_class = player_class
		@card_class = card_class.new
		@player = @player_class.new(@card_class.release_card, @card_class.release_card) 
		@dealer = @player_class.new(@card_class.release_card, @card_class.release_card)	
	end

	def winner?
		@player.score == BLACKJACK || @dealer.score == BLACKJACK
	end

	def deal
		@player.over_limit ? @dealer.add_card(@card_class.release_card) : @player.add_card(@card_class.release_card)
	end

	def game_over?
		@player.score > BLACKJACK || @dealer.score > BLACKJACK
	end

end