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
    start_station = @journey_log.start(station)
    @balance.apply_penalty if @message.has_penalty?(start_station)
  end

  def touch_out(station)
    finish_station = @journey_log.finish(station)
    return @balance.apply_penalty if @message.has_penalty?(finish_station)
    @balance.deduct(@journey_log.last_journey)
  end
end
