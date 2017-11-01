require 'game'

describe Game do 
	let(:player_class){double :player_class}
	let(:player){double :player}
	let(:dealer){double :dealer}
	subject{Game.new(player_class)}

	it 'initializes with no player and no dealer' do
		expect(subject.player).to eq nil
		expect(subject.dealer).to eq nil
	end

context 'When the game is played for the first time' do  

	it 'creates a player and a dealer if there are no current players' do 
		expect(player_class).to receive(:new).and_return player
		expect(player_class).to receive(:new).and_return dealer
		subject.deal_game
		expect(subject.player).to eq player
		expect(subject.dealer).to eq dealer
	end
end

end