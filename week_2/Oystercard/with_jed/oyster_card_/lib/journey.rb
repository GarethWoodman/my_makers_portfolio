class Journey
  MINIMUM_FARE  = 1
  PENALTY       = 6
  attr_reader :journeys, :entry, :exit, :fare

  def initialize
    @journeys = []
    @entry = nil
    @exit = nil
    @fare = MINIMUM_FARE
  end

  def add_entry(station)
    @fare = PENALTY if @entry
    @entry = station
  end

  def add_exit(station)
    @fare = PENALTY if !@entry
    @exit = station
  end

  def in_journey
    !!@entry
  end
end
