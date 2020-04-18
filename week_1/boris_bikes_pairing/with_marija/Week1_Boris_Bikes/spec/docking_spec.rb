require "BorisBikes.rb"


describe DockingStation do
  it "feature test release bike" do
    is_expected.to respond_to(:release_bike)
  end

  # Option 2 #
  # docking_station = DockingStation.new
  # it  do
  #   expect(docking_station).to respond_to(:release_bike)
  # end

  it "Releases new bike" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_a Bike
  end

  it "Checks new bike works" do
    subject.dock(Bike.new)
    expect(subject.release_bike.working?).to eq(true)
  end

  it "Checks that dock method works" do
    is_expected.to respond_to(:dock)
  end

  it "Checks that the bike is docked " do
    subject.dock(Bike.new)
    expect(subject.bikes.count).to eq(1)
  end

  it "Checks if bike exists in dock" do
    subject.dock(Bike.new)
    expect(subject.bikes[0]).to be_a Bike
  end

  it "Raises error if no bikes are stored" do
    expect{subject.release_bike}.to raise_error("No bikes available")
  end

  it "Doesn't allow bike to dock if capacity = 20" do
    station = DockingStation.new(20)
    station.capacity.times { subject.dock(Bike.new) }
    expect{subject.dock(Bike.new)}.to raise_error("Dock is full")
  end

  it "allow user to set dock capacity" do
    station = DockingStation.new(30)
    expect(station.capacity).to eq(30)
  end
end
