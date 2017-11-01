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

	describe '#black_jack?'
		it 'returns true if cards total amount equals 21' do 
			expect(subject.black_jack).to eq true
		end

	describe '#add_card' do 
		it 'adds a card to the players hand' do 
			subject.add_card(10)
			expect(subject.cards).to eq [10,11,10]
		end
	end 

	describe '#over_21' do 
		it 'returns true if the card score is above 21' do 
			subject.add_card(10)
			expect(subject.over_21).to eq true
		end

		it 'returns false if the card score is below 21' do 
			expect(subject.over_21).to eq false
		end
	end

end 