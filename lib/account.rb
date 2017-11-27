require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :transactions

  def initialize(starting_balance, transaction_class=Transaction, statement_class=Statement)
    @balance = starting_balance
    @transaction_class = transaction_class
    @transactions = []
    @statement_class = statement_class
  end

  def withdraw(amount, date=Date.today)
    @balance -= amount
    @transactions << @transaction_class.new(amount, date, @balance, :withdrawal)
  end

  def deposit(amount, date=Date.today)
    @balance += amount
    @transactions << @transaction_class.new(amount, date, @balance, :deposit)
  end

  def print_statement
    statement = @statement_class.new(@transactions)
    statement.print
  end
end
