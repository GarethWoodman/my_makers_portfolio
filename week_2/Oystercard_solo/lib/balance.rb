require './lib/fare'

class Balance
  MAXIMUM = 90

  def initialize
    @balance = 0
    @fare = Fare.new
  end

  def add(amount)
    @balance += amount
  end

  def deduct(journey)
    @balance -= @fare.calculate(journey)
  end

  def apply_penalty
    @balance -= Fare::PENALTY
  end

  def get
    @balance
  end
end
