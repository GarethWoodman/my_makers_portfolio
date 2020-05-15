class Thermostat
  attr_reader :temperature
  attr_accessor :power_save_mode

  def initialize
    @temperature = 20
    @power_save_mode = "off"
  end

  def up
    @temperature += 1
  end

  def down
    @temperature -=1 
  end

end
