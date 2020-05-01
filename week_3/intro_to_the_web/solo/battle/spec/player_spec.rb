require 'player'

describe Player do
  subject(:dave) { Player.new('Dave') }
  subject(:mittens) { Player.new('Mittens') }

  describe '#name' do
    it 'returns the name' do
      expect(dave.name).to eq 'Dave'
    end
  end

  describe '#hitpoints' do
    it 'has 60 hp on startup' do
      expect(dave.hitpoints).to eq described_class::DEFAULT_HP
    end
  end

  describe '#recieve_damage' do
    it 'deducts points' do
      expect { dave.recieve_damage }.to change { dave.hitpoints }.by -10
    end
  end
end
