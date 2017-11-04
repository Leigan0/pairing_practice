require 'game'

describe Game do 
	let(:player_class){double :player_class, new: player}
	let(:card) {double :card}
	let(:card_class){double :card_class, new: deck}
	let(:deck) {double :deck, release_card: card}
	let(:player){double :player, add_card: card}
	subject{Game.new(player_class, card_class)}

	describe '#initialize' do 
		it 'creates a player and a dealer' do 
				expect(subject.player).to eq player
				expect(subject.dealer).to eq player
			end
		it 'initializes with a deck of cards' do 
			expect(subject.card_class).to eq deck
		end # do I need to check that game creates a new card(deck of cards - maybe need to rename) object?? 
		
		# it 'deals two cards to both the player and the dealer' do
		# 	expect(card_class).to receive(:release_card).and_return(:card)
		# 	expect(card_class).to receive(:release_card).and_return(:card) 
		# 	expect(card_class).to receive(:release_card).and_return(:card) 
		# 	expect(card_class).to receive(:release_card).and_return(:card)  
		# end
		#need to work on this - already initialized when tests run - unsure how to test / if i need to?
	end

	describe '#winner?' do 
		it 'returns true if either player has blackjack' do 
			allow(player).to receive(:black_jack).and_return(true)
			expect(subject.winner?).to eq true
		end

		it 'returns false both either players does not have blackjack' do 
			allow(player).to receive(:black_jack).and_return(false)
			expect(subject.winner?).to eq false
		end
	end

	describe '#deal' do 
		context 'Player card total less than 17' do 
			it 'should deal another card to players hand' do 
				allow(player).to receive(:over_limit).and_return(false)
				expect(subject.player).to receive(:add_card)
				expect(subject.dealer).not_to receive(:add_card)
				subject.deal
			end
		end

		context 'Player card total more than 17, dealers hand less than players' do 
			it 'should deal another card to dealers hand' do
				allow(player).to receive(:over_limit).and_return(true)
				expect(subject.dealer).to receive(:add_card)
				expect(subject.player).not_to receive(:add_card)
				subject.deal
			end
			#discuss this? is this actually testing this? player and dealer are same double so diffcult to test / separate ?
		end

	end

end