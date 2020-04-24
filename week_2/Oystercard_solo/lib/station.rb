class Station
  attr_reader :name, :zone

  def initialize(name = "Unnamed Station", zone = 0)
    @name = name
    @zone = zone
  end
end
