class Card
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :journeys

  def initialize(balance=0)
    @balance = balance
    @journeys = []
    @current_journey = Journey.new
  end

  def top_up(amount)
    fail "Cannot top-up with negative amount" if amount < 0
    fail "Top-up exceeds balance limit" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def tap_in(entry_station)
    fail "Insufficient funds: min. £#{MIN_BALANCE} required" if @balance < MIN_BALANCE
    deduct_fare(Journey::PENALTY) if @current_journey.entry_station
    @current_journey = Journey.new
    @current_journey.entry_station = entry_station
    @journeys.push(@current_journey)
  end

  def tap_out(exit_station)
    @current_journey.exit_station = exit_station
    @current_journey.complete? ? deduct_fare(@current_journey.fare) : deduct_fare(Journey::PENALTY)
  end

  def in_journey?
    @current_journey.complete? ? false : true
  end

  private
  def deduct_fare(amount)
    @balance -= amount
  end

end
