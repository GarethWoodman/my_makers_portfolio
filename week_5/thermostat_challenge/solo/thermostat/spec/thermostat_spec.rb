require 'thermostat'

describe Thermostat do

  context '@temperature' do
    it 'returns default temperature' do
      expect(subject.temperature).to eq 20
    end
  end

  context '@power_save_mode' do
    it 'returns default power save mode' do
      expect(subject.power_save_mode).to eq "off"
    end

    it "returns 'on' if power save mode is on" do
      subject.power_save_mode = "on"
      expect(subject.power_save_mode).to eq "on"
    end
  end

  context '#up' do
    it 'increases temperature by 1' do
      expect { subject.up }.to change { subject.temperature }.by 1
    end
  end

  context '#down' do
    it 'decreases temperature by 1' do
      expect { subject.down }.to change { subject.temperature }.by -1
    end
  end
end
