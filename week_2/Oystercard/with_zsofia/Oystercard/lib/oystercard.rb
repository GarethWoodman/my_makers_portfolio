class Oystercard
  LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :journeys, :journey

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
    @journey = Hash.new
  end

  def top_up(amount)
    @balance + amount <= LIMIT ? @balance += amount : exceeds_balance
  end

  def touch_in(station)
    not_minimum if @balance < MINIMUM_BALANCE
    @journey["entry_station"] = station
  end

  def touch_out(station)
    if in_journey?
      deduct(MINIMUM_BALANCE)
      @journey["exit_station"] = station
      add_journey
    end
  end

  private
  def exceeds_balance
    raise "Exceeds balance limit of #{LIMIT}"
  end

  def not_minimum
    raise "Does not have the minimum amount"
  end

  def in_journey?
    @journey["entry_station"] != nil
  end

  def deduct(amount)
    @balance -= amount
  end

  def add_journey
    @journeys << @journey
    @journey = Hash.new
  end
end
