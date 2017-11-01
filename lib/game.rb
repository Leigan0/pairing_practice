require_relative 'player'
require_relative 'card'

class Game 

	attr_reader :player, :dealer, :card_class

	def initialize(player_class, card_class)
		@player_class = player_class
		@card_class = card_class.new
		@player = @player_class.new(@card_class.release_card, @card_class.release_card) 
		@dealer = @player_class.new(@card_class.release_card, @card_class.release_card)	
	end

end