require 'oystercard'
require 'station'
require 'journey'

describe Oystercard do
    subject(:oystercard) {described_class.new}
    let(:station) { Station.new }
    let(:exit_station) {double :exit_station}

    it "oyster card has 0 as default value" do
        expect(oystercard.balance.get).to eq(0)
    end

    # it "oyster card loaded with 5 pounds" do
    #     expect(oystercard.top_up(5)).to eq(5)
    # end

    describe "#top_up" do

       #it { is_expected.to respond_to(:top_up).with(1).argument }

       it "can top up the balance" do
        expect{ subject.top_up 1 }.to change{ subject.balance.get }.by 1
       end

       it "raises an error if the maximun balance is exeeded" do
         maximum_balance = Balance::MAXIMUM
         oystercard.top_up(maximum_balance)
         expect{ subject.top_up 1 }.to raise_error "Maximum of #{maximum_balance} balance exceeded"
       end
    end

  #   describe "#deduct" do

  #     it { is_expected.to respond_to(:deduct).with(1).argument }

  #     it "should be able to deduct from balance" do
  #       expect { subject.deduct(5) }.to change{ subject.balance.get.get }.by(-5)
  #     end
  # end

  describe "#touch_in" do

    it "Should raise error when you try to touch in with balance less than min fare" do
      expect{ subject.touch_in(station) }.to raise_error("Balance too low")
    end
  end

  describe "#touch_out" do
  before(:each) {subject.top_up(10)}

    it "deducts money from card once touch_out" do
      subject.touch_in(Station.new)
      expect{subject.touch_out(Station.new)}.to change{subject.balance.get}.by(-Fare::MINIMUM)
  end
end

describe "entry_station" do
  before(:each) {subject.top_up(10)}
  before(:each) { subject.touch_in(station) }

  it 'Should track what the entry station is after touch in' do
    expect(subject.journey_log.current_journey.entry).to eq(station)
  end

  it 'After touching out current_journey should return empty journey' do
    subject.touch_out(station)
    expect(subject.journey_log.current_journey.class).to eq(Journey)
  end
end

describe "journey" do
  before(:each) {subject.top_up(10)}

  it "A new card should have a empty list of journeys" do
    expect(subject.journey_log.journeys).to eq([])
  end
end

end
