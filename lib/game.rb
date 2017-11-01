class Game 

	attr_reader :player, :dealer

	def initialize(player_class)
		@player = nil
		@dealer = nil
		@player_class = player_class
	end

	def deal_game
		@player = @player_class.new
		@dealer = @player_class.new
	end

end