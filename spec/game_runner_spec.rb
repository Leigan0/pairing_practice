require 'game_runner'

describe GameRunner do 
	let(:game){double :game, blackjack: true, winner: 'Player'}
	let(:card_class){double :card_class}
	let(:player_class){double :player_class}
	let(:game_class){double :game_class, new: game}
	subject { GameRunner.new(game_class,player_class,card_class)}

	describe '#play_game' do 
		it 'creates a new game object' do 
			expect(subject.game_class).to receive(:new)
			expect(subject.player_class).to receive(:new).exactly(2).times
			expect(subject.card_class).to receive(:new)
			allow(game).to receive(:deal_game)
			subject.play_game
		end
	end

	it 'exits the app' do 
			expect { subject.end_game }.to raise_error(SystemExit)
		end 

end 