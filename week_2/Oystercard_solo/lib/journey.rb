class Journey
  attr_accessor :entry, :exit, :fare

  def initialize
    @entry = nil
    @exit = nil
  end

  def complete?
    @entry && @exit
  end

  def in_journey?
    @entry && @exit.nil?
  end
end
