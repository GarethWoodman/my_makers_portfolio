class Bank
  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def get_balance
    @balance
  end

  def credit_account(date, amount)
    @balance += amount
    @statement.add(date, "Deposited: #{amount}", @balance)
  end

  def debit_account(date, amount)
    @balance -= amount
    @statement.add(date, "Withdrawn: #{amount}", @balance)
  end

  def print_statement
    @statement.print
  end
end

class Statement
  def initialize
    @transactions = Hash.new
  end

  def print
    @transactions.each do |date, transaction|
      amount  = transaction[0]
      balance = transaction[1]
      print_transaction(date, amount, balance)
    end
  end

  def add(date, amount, balance)
    @transactions[date] = [amount, balance]
  end

  private
  def print_transaction(date, amount, balance)
    puts "Date: #{date}"
    puts amount
    puts "Balance: #{balance}"
    puts ""
  end
end

bank = Bank.new

bank.credit_account("1st September 2020", 120)
bank.debit_account("2nd September 2020", 50)
bank.print_statement
