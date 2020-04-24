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
end
