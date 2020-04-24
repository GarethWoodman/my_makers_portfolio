require './lib/station.rb'
require './lib/journey.rb'
require './lib/journey_log.rb'
require './lib/balance.rb'
require './lib/message.rb'

class Oystercard
  attr_reader :balance, :journey_log

  def initialize
    @journey_log = JourneyLog.new
    @balance = Balance.new
    @message = Message.new
  end

  def top_up(amount)
    @message.reached_maximum?(@balance, amount)
    @balance.add(amount)
  end

  def touch_in(station)
    @message.has_minimum?(@balance)
    @balance.apply_penalty if @journey_log.start(station) == false
  end

  def touch_out(station)
    return @balance.apply_penalty if @journey_log.finish(station) == false
    @balance.deduct(@journey_log.last_journey)
  end
end
