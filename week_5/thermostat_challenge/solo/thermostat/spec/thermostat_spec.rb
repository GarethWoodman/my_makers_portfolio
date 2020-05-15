require 'thermostat'

describe Thermostat do

  it 'returns default temperature' do
    expect(subject.temperature).to eq 20
  end

end
