require 'game_runner'

describe GameRunner do 
	let(:card) {double :card}
	let(:player){double :player}
	let(:game){double :game, blackjack: true, winner: 'Player'}
	let(:card_class){double :card_class, new: card}
	let(:player_class){double :player_class, new: player}
	let(:game_class){double :game_class, new: game}
	subject { GameRunner.new(game_class: game_class,player_class: player_class,card_class: card_class)}

	describe '#play_game' do 
		it 'creates a new game object' do 
			expect(subject.game_class).to receive(:new)
			expect(subject.player_class).to receive(:new).exactly(2).times
			expect(subject.card_class).to receive(:new)
			allow(game).to receive(:deal_game)
			subject.play_game
		end

		it 'deals inital hand to player and dealer' do 
			expect(game).to receive(:deal_game).with(instance_of(Fixnum)) 
			subject.play_game
		end

		it 'returns the winner if either player is dealt initial hand of blackjack' do 
			allow(game).to receive(:deal_game)
			expect(subject.play_game).to eq 'Player'
		end

		it 'deals hand to player if neither player has blackjack within first hand' do
			allow(game).to receive(:deal_game)
			allow(game).to receive(:blackjack).and_return(false)
			expect(game).to receive(:deal_to_player)
			subject.play_game
		end
	end

	it 'exits the app' do 
			expect { subject.end_game }.to raise_error(SystemExit)
		end 

end 