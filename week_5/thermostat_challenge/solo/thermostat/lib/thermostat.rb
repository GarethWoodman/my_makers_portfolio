class Thermostat
  attr_reader :temperature, :power_save_mode

  def initialize
    @temperature = 20
    @power_save_mode = "off"
  end
end
