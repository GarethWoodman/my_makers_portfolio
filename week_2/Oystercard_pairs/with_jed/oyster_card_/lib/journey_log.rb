require './lib/journey.rb'

class JourneyLog
  attr_reader :journeys, :current_journey

  def initialize(journey = Journey.new)
    @current_journey = journey
    @journeys = []
  end

  def start(station)
    @current_journey = Journey.new unless @current_journey
    @current_journey.add_entry(station)
  end

  def finish(station)
    return false unless @current_journey
    @current_journey.add_exit(station)
    add_journey
  end

  private
  def reset
    @current_journey = nil
  end

  def add_journey
    if @current_journey.entry && @current_journey.exit
      @journeys << {:entry_station => @current_journey.entry,
                    :exit_station => @current_journey.exit }
      reset
    end
  end
end
