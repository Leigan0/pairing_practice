
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

	def blackjack
		@player.score == BLACKJACK || @dealer.score == BLACKJACK
	end

	def deal_to_player
		while !@player.over_limit do 
			@player.add_card(@card_class.release_card)
		end
		dealer_turn
	end

	def dealer_turn
		game_over(@player) ? complete("Dealer wins player score #{@player.score}, dealer score #{@dealer.score}") : deal_to_dealer
	end

	def deal_to_dealer
		while @player.score > @dealer.score
			@dealer.add_card(@card_class.release_card)
		end
		winner
	end

	def winner
		if game_over(@dealer)
			complete("Player wins player score #{player.score}, dealer score #{dealer.score}")
		elsif @player.score < @dealer.score
			complete("Dealer wins player score #{player.score}, dealer score #{dealer.score}")
		else
			complete("Dealer wins player score #{player.score}, dealer score #{dealer.score}") #This covers when both have matching score
		end
	end

	def game_over(player)
		player.score > BLACKJACK
	end

	def complete(message)
		message
	end
end