require './lib/station.rb'
require './lib/journey.rb'
require './lib/journey_log.rb'

class Oystercard
    MAXIMUM_BALANCE = 90
    FARE            = Journey::MINIMUM_FARE
    PENALTY         = Journey::PENALTY

    attr_reader :balance, :journey_log

    def initialize
        @journey_log = JourneyLog.new
        @balance = 0
    end

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end

    def touch_in(station)
        fail "Balance too low" if balance < FARE
        @journey_log.start(station)
        deduct(PENALTY) if @journey_log.current_journey.fare == PENALTY
    end

    def touch_out(station)
        return deduct(PENALTY) if @journey_log.finish(station) == false
        deduct(FARE)
    end

    private
    def deduct(ammount)
        @balance -= ammount
    end
end
