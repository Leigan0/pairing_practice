require_relative 'card'

class Player
	attr_reader :cards

	BLACKJACK = 21 
	LIMIT = 17

	 def initialize(c1,c2)
	 	@cards = [c1,c2]
	 end

	 def black_jack
	 	score == BLACKJACK
	 end

	 def add_card(card)
	 	@cards << card
	 end

	 def score
	 	@cards.inject(0, &:+) 
	 end

	 def over_black_jack
	 	score > BLACKJACK
	 end

	 def over_limit
	 	score > LIMIT
	 end
end