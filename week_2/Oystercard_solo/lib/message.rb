require './lib/balance.rb'

class Message
  def reached_maximum?(balance, amount)
    if (balance.get + amount) > Balance::MAXIMUM
      fail "Maximum of #{Balance::MAXIMUM} balance exceeded"
    end
  end

  def has_minimum?(balance)
    fail "Balance too low" if balance.get < Fare::MINIMUM
  end

  def has_penalty?(station)
    station == false ? print("Penalty applied") : false
  end

  private
  def print(message)
    puts(message)
    true
  end
end
