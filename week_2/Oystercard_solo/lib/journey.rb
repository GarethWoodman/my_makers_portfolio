class Journey
  MINIMUM = 1
  PENALTY = 6
  attr_accessor :entry, :exit

  def initialize
    @entry = nil
    @exit = nil
  end

  def complete?
    @entry && @exit
  end

  def fare
    return PENALTY unless complete?
    MINIMUM + (entry.zone - exit.zone).abs
  end

  def in_journey?
    @entry && @exit.nil?
  end
end
