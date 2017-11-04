require_relative 'card'

class Player
	attr_reader :cards

	LIMIT = 17

	 def initialize(c1,c2)
	 	@cards = [c1,c2]
	 end

	 def add_card(card)
	 	@cards << card
	 end

	 def score
	 	@cards.inject(0, &:+) 
	 end

	 def over_limit
	 	score > LIMIT
	 end


end