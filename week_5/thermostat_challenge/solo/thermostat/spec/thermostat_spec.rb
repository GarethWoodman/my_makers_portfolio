require 'thermostat'

describe Thermostat do
  it 'returns default temperature' do
    expect(subject.temperature).to eq 20
  end

  it 'returns default power save mode' do
    expect(subject.power_save_mode).to eq "off"
  end
end
