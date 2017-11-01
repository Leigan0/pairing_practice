require 'game'

describe Game do 
	let(:player_class){double :player_class, new: player}
	let(:card) {double :card}
	let(:card_class){double :card_class, new: deck}
	let(:deck) {double :deck, release_card: card}
	let(:player){double :player}
	let(:dealer){double :dealer}
	subject{Game.new(player_class, card_class)}

	describe '#initialize' do 
		it 'creates a player and a dealer' do 
				expect(subject.player).to eq player
				expect(subject.dealer).to eq player
			end
		it 'initializes with a deck of cards' do 
			expect(subject.card_class).to eq deck
		end # do I need to check that game creates a new card(deck of cards - maybe need to rename) object?? 
		
		it 'deals two cards to both the player and the dealer' do
			expect(card_class).to receive(:release_card).and_return(:card)
			expect(card_class).to receive(:release_card).and_return(:card) 
			expect(card_class).to receive(:release_card).and_return(:card) 
			expect(card_class).to receive(:release_card).and_return(:card)  
		end
	end

end