class Thermostat
  attr_reader :temperature
  attr_accessor :power_save_mode

  def initialize
    @temperature = 20
    @power_save_mode = "off"
  end
end
