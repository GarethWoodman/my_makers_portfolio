require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  before(:each) do
    @card = Oystercard.new
    @card.top_up(50)
    @card.touch_in(Station.new)
  end

  PENALTY = 6

  it "gives penalty if trying to touch in more than once in same journey" do
    expect{ @card.touch_in(Station.new) }.to change{@card.balance.get}.by(-PENALTY)
  end

  it "gives penalty if trying to touch out more than once in same journey" do
    @card.touch_out(Station.new)
    expect{ @card.touch_out(Station.new) }.to change{@card.balance.get}.by(-PENALTY)
  end
end
