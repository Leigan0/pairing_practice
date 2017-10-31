require 'player'

describe Player do 
	let(:card){double :card}
	subject{Player.new(:card,:card)}
	
	describe 'Initialize' do 
		it 'Player Initializes with two cards' do 
			expect(subject.cards.count).to eq 2
		end
	end
end 