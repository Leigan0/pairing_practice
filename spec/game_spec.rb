require 'game'

describe Game do 
	let(:card) {double :card}
	let(:card_class){double :card_class, release_card: card}
	let(:player){double :player, add_card: card, score: 18}
	let(:dealer){double :dealer, add_card: card, score: 18}
	subject{Game.new(player, dealer, card_class)}

	describe '#initialize' do 
		it 'initializes with two players' do 
				expect(subject.player).to eq player
				expect(subject.dealer).to eq dealer
			end
		it 'initializes with a deck of cards' do 
			expect(subject.card_class).to eq card_class
		end 
	end

	describe '#deal_game' do 
		it 'deals two cards to both player and dealer' do 
			expect(subject.player).to receive(:add_card).exactly(2).times
			expect(subject.dealer).to receive(:add_card).exactly(2).times
			subject.deal_game(2)
		end
	end

	describe '#blackjack' do 
		it 'returns true if either player has blackjack' do 
			allow(player).to receive(:score).and_return(21)
			expect(subject.blackjack).to eq true
		end

		it 'returns false both either players does not have blackjack' do 
			expect(subject.blackjack).to eq false
		end
	end

	describe '#deal_to_player' do 
		context 'Player card score is less than player limit' do 
			it 'Deals cards to player until score above limit' do 
				allow(player).to receive(:over_limit).and_return(false,false,true)
				expect(player).to receive(:add_card).exactly(2).times
				subject.deal_to_player
			end

		end
		context 'Player card score is higher than player limit' do 
			it 'Does not deal a further card to player' do 
				allow(player).to receive(:over_limit).and_return(true)
				expect(player).not_to receive(:add_card)
				subject.deal_to_player
			end
			it 'calls method dealer_turn once player score over limit' do 
				allow(player).to receive(:over_limit).and_return(false,true)
				expect(player).to receive(:score)
				subject.deal_to_player
			end
		end
	end

	describe '#deal_to_dealer' do 
		context 'Player score is higher than dealers' do 
			it 'Deals cards to dealer until score above players' do 
				allow(dealer).to receive(:score).and_return(10,13,16,20)
				expect(dealer).to receive(:add_card).exactly(3).times
				subject.deal_to_dealer
			end
		end

		context 'Players score is equal to dealers' do 
			it 'does not deal another card to dealer' do 
				expect(dealer).not_to receive(:add_card)
				subject.deal_to_dealer
			end
		end
		context 'Dealers score is higher than players' do
			it 'does not deal a card to dealer' do 
				allow(dealer).to receive(:score).and_return(20)
				expect(dealer).not_to receive(:add_card)
				subject.deal_to_dealer
			end
				it 'calls method winner once dealer score is higher than players' do 
				allow(dealer).to receive(:score).and_return(20)
				expect(dealer).to receive(:score)
				subject.deal_to_dealer
			end
		end
	end 

	describe '#dealer_turn' do 
		context 'Players score is over blackjack' do
			it 'ends game and confirms dealer has won - no further cards dealt to dealer' do
				allow(player).to receive(:score).and_return(22)
				expect(subject.dealer_turn).to eq "Dealer wins player score #{player.score}, dealer score #{dealer.score}"
			end
		end
		context 'Players score is under blackjack, but higher than players' do 
			it 'calls #deal_to_dealer method' do 
				allow(dealer).to receive(:score).and_return(12,20)
				expect(dealer).to receive(:add_card)
				subject.dealer_turn
			end 
		end
	end

	describe '#winner' do 
		context 'Players score under 21, dealers score over 21' do 
			it 'Ends game and confirms player is the winner' do 
				allow(dealer).to receive(:score).and_return(22)
				expect(subject.winner).to eq "Player wins player score #{player.score}, dealer score #{dealer.score}"
			end 
		end
		context 'Both under 21 dealers score is more than players score' do 
			it 'Ends game and confirms dealer is the winner' do 
				allow(dealer).to receive(:score).and_return(20)
				expect(subject.winner).to eq "Dealer wins player score #{player.score}, dealer score #{dealer.score}"
			end
		end
		context 'Both player and dealer have same score' do 
			it 'Ends game and returns dealer as winner' do 
				expect(subject.winner).to eq "Dealer wins player score #{player.score}, dealer score #{dealer.score}"
			end
		end
	end

	describe '#game_over' do 
		it 'returns false if score under blackjack' do 
			expect(subject.game_over(player)).to eq false
		end
		it 'returns true if score over blackjack' do 
			allow(dealer).to receive(:score).and_return(22)
			expect(subject.game_over(dealer)).to eq true
		end
	end

	describe '#complete' do 
		it 'returns message given as a parameter' do 
			expect(subject.complete('Bye')).to eq 'Bye'
		end
	end
end