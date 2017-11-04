require 'player'

describe Player do 
	let(:card_class){double :card_class}
	let(:card){double :card}
	card1 = 10 
	card2 = 11

	subject{Player.new(card1,card2)}

	describe 'Initialize' do 
		it 'Player Initializes with two cards' do 
			expect(subject.cards.count).to eq 2
		end
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

		it 'returns false if players hand is under set limit' do 
			subject = Player.new(2,3)
			expect(subject.over_limit).to eq false
		end
	end

end 