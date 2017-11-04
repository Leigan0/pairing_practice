require_relative 'player'
require_relative 'card'

class Game 

	attr_reader :player, :dealer, :card_class
	BLACKJACK = 21 

	def initialize(player, dealer, card_class)
		@card_class = card_class.new
		@player = player
		@dealer = dealer
	end

	def deal_game
		2.times{ @player.add_card(@card_class.release_card)
		@dealer.add_card(@card_class.release_card)}
	end

	def blackjack?
		@player.score == BLACKJACK || @dealer.score == BLACKJACK
	end

	def play_on
		@player.over_limit ? dealers_move : @player.add_card(@card_class.release_card)
	end

	def game_over?
		@player.score > BLACKJACK || @dealer.score > BLACKJACK
	end

	def dealers_move
		fail "Dealers hand exceeds players" if @player.score < @dealer.score
		@dealer.add_card(@card_class.release_card)
	end




end