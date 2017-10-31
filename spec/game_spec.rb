require 'game'

describe Game do 

	describe '#initialize' do 
		it 'it initializes with a deck of 52 card values' do 
			expect(subject.deck.count).to eq 52
		end
	end

end