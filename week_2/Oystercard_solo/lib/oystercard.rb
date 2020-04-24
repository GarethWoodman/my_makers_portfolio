require './lib/station.rb'
require './lib/journey.rb'
require './lib/journey_log.rb'

class Oystercard
  MAXIMUM = 90
  attr_reader :balance, :journey_log

  def initialize
    @journey_log = JourneyLog.new
    @balance = 0
  end

  def top_up(amount)
    @balance += amount unless exceeds_maximum?(amount)
  end

  def touch_in(station)
    touched_out?
    @journey_log.start(station) unless sufficent_funds?
  end

  def touch_out(station)
    completed_journey = @journey_log.current_journey
    @journey_log.finish(station)
    @balance -= completed_journey.fare
  end

  private
  def exceeds_maximum?(amount)
    fail "Maximum of #{MAXIMUM} balance exceeded" if (@balance + amount) > MAXIMUM
  end

  def sufficent_funds?
    fail "Balance too low" if @balance < Journey::MINIMUM
  end

  def touched_out?
    @balance -= Journey::PENALTY unless @journey_log.current_journey.complete?
  end

end
