class Calculator
  def initialize
    @answer = Answer.new
  end

  def add(number_1, number_2)
    @answer.print(number_1 + number_2)
  end

  def subtract(number_1, number_2)
    @answer.print(number_1 - number_2)
  end
end

class Answer
  def print(answer)
    "The Answer is: #{ answer }"
  end
end

calculator = Calculator.new
puts calculator.add(1, 3)
