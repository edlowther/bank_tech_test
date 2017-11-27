require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(starting_balance, transaction_class=Transaction)
    @balance = starting_balance
    @transaction_class = transaction_class
    @transactions = []
  end

  def withdraw(amount, date=Date.today)
    @balance -= amount
    @transactions << @transaction_class.new(amount, date)
  end

  def deposit(amount, date=Date.today)
    @balance += amount
    @transactions << @transaction_class.new(amount, date)
  end
end
