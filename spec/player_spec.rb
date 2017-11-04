require 'player'

describe Player do 
	let(:card_class){double :card_class}
	let(:card){double :card}
	

	subject{Player.new}

	describe 'Initialize' do 
		it 'Player Initializes with empty set of cards' do 
			expect(subject.cards).to be_empty
		end
	end

	context 'Players have been dealt two intial cards' do 
		before do 
			subject.add_card(10)
			subject.add_card(11)
		end

		describe '#score' do 
			it 'returns the sum of the card values' do 
				expect(subject.score).to eq 21
			end 
		end 

		describe '#add_card' do 
			it 'adds a card to the players hand' do 
				subject.add_card(10)
				expect(subject.cards).to eq [10,11,10]
			end
		end 

		describe '#over_limit' do 
			it 'returns true if players hand is over set limit' do 
				expect(subject.over_limit).to eq true
			end 
		end
	end

	context 'Players hand total is under set limit' do 
		describe '#over_limit' do 
			it 'returns false if players hand is under set limit' do 
				subject = Player.new
				subject.add_card(Player::LIMIT)
				expect(subject.over_limit).to eq false
			end
		end
	end

end 