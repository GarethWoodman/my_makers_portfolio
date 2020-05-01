describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe '#attack' do
    it 'deducts 10 points off the other player' do
      expect(player_2).to receive(:recieve_damage)
      #call attack to invoke method on player_2 object
      game.attack(player_2)
    end
  end

  describe '#player_1 & #player_2' do
    it 'checks that it has two player instances' do
      expect(game.player_1).to eq player_1
      expect(game.player_2).to eq player_2
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

  describe '#opposing_player' do
    it 'returns opposing player on current turn' do
      expect(game.opposing_player).to eq player_2
    end
  end

  describe '#player_lost' do
    it 'returns true if a player has 0 HP' do
      player_1.stub(:hitpoints) { 0 }
      player_2.stub(:hitpoints) { 10 }
      expect(game.player_lost?).to eq true
    end
  end
end
