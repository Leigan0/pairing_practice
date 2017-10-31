require 'player'

describe Player do 
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
end 