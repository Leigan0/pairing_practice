require_relative 'player'
require_relative 'card'

class Game 

BLACKJACK = 21

	attr_reader :player, :dealer, :card_class
	
	def initialize(player, dealer, card_class)
		@card_class = card_class
		@player = player
		@dealer = dealer
	end

	def deal_game(num_of_cards)
		num_of_cards.times { 
			@player.add_card(@card_class.release_card)
			@dealer.add_card(@card_class.release_card)
		}
	end

	def player_turn
		deal_to_player
		dealer_turn
	end

	def deal_to_player
		while !@player.over_limit do 
			@player.add_card(@card_class.release_card)
		end
	end

	def dealer_turn
		game_over(@player) ? finish("Dealer wins player score #{@player.score}, dealer score #{@dealer.score}") : @deal_to_dealer
		winner
	end

	def deal_to_dealer
		while @player.score > @dealer.score
			@dealer.add_card(@card_class.release_card)
		end
	end

	def winner
		if game_over(@dealer)
			finish("Player wins player score #{player.score}, dealer score #{dealer.score}")
		elsif @player.score < @dealer.score
			finish("Dealer wins #{player.score}, dealer score #{dealer.score}")
		else
			finish("Dealer wins player score #{player.score}, dealer score #{dealer.score}")
		end
	end

	def finish(message)
		puts message
		exit
	end

	def blackjack
		@player.score == BLACKJACK || @dealer.score == BLACKJACK
	end

	def game_over(player)
		player.score > BLACKJACK
	end

end