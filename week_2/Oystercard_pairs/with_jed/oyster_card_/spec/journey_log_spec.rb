require 'journey'
require 'journey_log'
require 'oystercard'

describe JourneyLog do
  before(:each) do
    @journey_log = JourneyLog.new
    @journey_log.start("Camden")
  end

  it "returns list of journeys" do
    expect(@journey_log.journeys.class).to eq Array
  end

  it '#start should start a new journey with an entry station' do
    expect(@journey_log.current_journey.entry).to eq("Camden")
  end

  it '#finish should end current_journey with exit station' do
    expect(@journey_log).to respond_to(:finish)
  end
end
