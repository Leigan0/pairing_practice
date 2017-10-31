class Player
	attr_reader :cards

	 def initialize(c1,c2)
	 	@cards = [c1,c2]
	 end

	 def black_jack
	 	score == 21
	 end

	 def add_card(card)
	 	@cards << card
	 end

	 def score
	 	@cards.inject(0, &:+) 
	 end

	 def over_21
	 	score > 21
	 end
end