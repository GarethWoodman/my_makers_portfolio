require './lib/docking_station'

def docking_station_with_added_bike
    docking_station = DockingStation.new
    docking_station.dock_bike(Bike.new)
    return docking_station
end

describe 'DockingStation' do

    it 'return true to method release_bike' do
        expect(DockingStation.new).to respond_to(:release_bike)
    end

    it 'return a bike' do
        docking_station = docking_station_with_added_bike
        #station = DockingStation.new
        expect((docking_station.release_bike).class).to eq (Bike)
    end 

    it 'return true to bike.working?' do 
        docking_station = docking_station_with_added_bike
        bike = docking_station.release_bike 
        expect(bike.working?).to eq (true)
    end 

    it 'return true to method dock bike' do
        expect(DockingStation.new).to respond_to(:dock_bike)
    end 

    it 'return array of bike objects to instance variable bikes of DockingStation' do
        docking_station = docking_station_with_added_bike
        expect((docking_station.bikes).count).to eq (1)
    end

end
