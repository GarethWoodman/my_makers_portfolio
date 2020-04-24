class Fare
  MINIMUM = 1
  PENALTY = 6

  def calculate(journey)
    MINIMUM + (journey.entry.zone - journey.exit.zone).abs
  end
end
