require './lib/bike'

describe 'Bike' do 
    it 'return true to method working' do
        expect(Bike.new).to respond_to(:working?)
    end
end 




=begin 
require './lib/docking_station'

describe 'DockingStation' do
    it 'return true to method release_bike' do
        expect(DockingStation.new).to respond_to(:release_bike)
    end
end
=end 

