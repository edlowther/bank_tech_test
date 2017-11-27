require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :transactions

  def initialize(starting_balance, transaction_class=Transaction, statement=Statement.new)
    @balance = starting_balance
    @transaction_class = transaction_class
    @transactions = []
    @statement = statement
  end

  def withdraw(amount, date=Date.today)
    @balance -= amount
    @transactions << @transaction_class.new(amount, date)
  end

  def deposit(amount, date=Date.today)
    @balance += amount
    @transactions << @transaction_class.new(amount, date)
  end

  def print_statement
    @statement.print
  end 
end
