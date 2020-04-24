class Journey
  PENALTY     = 6

  attr_accessor :entry_station, :exit_station

  def initialize
    @entry_station = nil
  end

  def complete?
    return false if @exit_station.nil? || @entry_station.nil?
    true
  end

  def fare
    1
  end

end
