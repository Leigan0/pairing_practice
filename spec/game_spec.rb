require 'game'

describe Game do 
	let(:card) {double :card}
	let(:card_class){double :card_class, new: deck}
	let(:deck) {double :deck, release_card: card}
	let(:player){double :player, add_card: card, score: 18}
	let(:dealer){double :dealer, add_card: card}
	subject{Game.new(player, dealer, card_class)}

	describe '#initialize' do 
		it 'initializes with two players' do 
				expect(subject.player).to eq player
				expect(subject.dealer).to eq dealer
			end
		it 'initializes with a deck of cards' do 
			expect(subject.card_class).to eq deck
		end # do I need to check that game creates a new card(deck of cards - maybe need to rename) object?? 
	end

	describe '#deal_game' do 
		it 'deals two cards to both player and dealer' do 
			expect(subject.player).to receive(:add_card)
			expect(subject.player).to receive(:add_card)
			expect(subject.dealer).to receive(:add_card)
			expect(subject.dealer).to receive(:add_card)
			subject.deal_game
		end
	end

	describe '#blackjack?' do 
		it 'returns true if either player has blackjack' do 
			allow(player).to receive(:score).and_return(21)
			expect(subject.blackjack?).to eq true
		end

		it 'returns false both either players does not have blackjack' do 
			allow(dealer).to receive(:score).and_return(18)
			expect(subject.blackjack?).to eq false
		end
	end

	describe '#play_on' do 
		context 'Player card total less than 17' do 
			it 'should deal another card to players hand' do 
				allow(player).to receive(:over_limit).and_return(false)
				expect(subject.player).to receive(:add_card)
				expect(subject.dealer).not_to receive(:add_card)
				subject.play_on
			end
		end

		context 'Player card total more than player limit, dealers hand less than players score' do 
			it 'should deal another card to dealers hand' do
				allow(player).to receive(:over_limit).and_return(true)
				allow(dealer).to receive(:score).and_return(12)
				expect(subject.dealer).to receive(:add_card)
				subject.play_on
			end
			it 'should not deal another card to players hand' do 
				allow(player).to receive(:over_limit).and_return(true)
				allow(dealer).to receive(:score).and_return(12)
				expect(subject.player).not_to receive(:add_card)
				subject.play_on
			end
		end
	end

	describe '#dealers_move' do 
		it 'deals a card to dealer if their total score is less than players' do
			allow(dealer).to receive(:score).and_return(15)
			expect(dealer).to receive(:add_card)
			subject.dealers_move
		end

		it 'raises error message when dealers total score is more than players' do 
			allow(dealer).to receive(:score).and_return(20)
			expect{ subject.dealers_move }.to raise_error(RuntimeError, "Dealers hand exceeds players")
		end 
	end

	describe '#game_over?' do 
		it 'if player either over blackjack limit returns true' do 
			allow(player).to receive(:score).and_return(22)
			expect(subject.game_over?).to eq true
		end

		it 'returns false if both players score under blackjack limit' do 
			allow(player).to receive(:score).and_return(18)
			allow(dealer).to receive(:score).and_return(18)
			expect(subject.game_over?).to eq false
		end
	end

end