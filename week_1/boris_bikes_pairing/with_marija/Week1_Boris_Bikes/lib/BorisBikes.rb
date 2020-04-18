class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    empty?
    @bikes.pop
  end

  def dock(bike)
    full?
    @bikes.push(bike)
  end

  private
  def full?
    fail "Dock is full" unless @bikes.count != DEFAULT_CAPACITY
  end

  def empty?
    fail "No bikes available" unless @bikes.count != 0
  end

end

class Bike
  def working?
    true
  end
end
