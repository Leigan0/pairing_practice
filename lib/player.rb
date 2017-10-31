class Player
	attr_reader :cards
	attr_reader :score

	 def initialize(c1,c2)
	 	@cards = [c1,c2]
		@score = @cards.inject(0, &:+) 
	 end

	 def black_jack
	 	@score == 21
	 end
end