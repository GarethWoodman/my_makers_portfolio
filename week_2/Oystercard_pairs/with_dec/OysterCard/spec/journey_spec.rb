require 'journey'

describe Journey do

  before do
    @asubject = described_class.new
  end

  it "responds to entry station" do
    #subject = described_class.new(double())
    expect(@asubject).to respond_to(:entry_station)
  end

  describe "#complete?" do

    let(:entry_station) { double("Entry Station") }
    let(:exit_station) { double("Exit Station") }

    it "returns true if there is no exit_station" do
      subject = described_class.new
      expect(subject.complete?).to be false
    end

    it "returns true if there is no entry_station" do
      subject = described_class.new
      subject.exit_station = exit_station
      expect(subject.complete?).to be false
    end

    it "returns false if there is an exit_station" do
      subject = described_class.new
      subject.exit_station = exit_station
      subject.entry_station = entry_station
      expect(subject.complete?).to be true
    end
  end

  describe "#fare" do
    it "returns minimum fare" do
      expect(subject.fare).to eq(1)
    end
  end
end
