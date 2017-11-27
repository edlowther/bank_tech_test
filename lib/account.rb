class Account
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def withdraw(amount)
    @balance -= amount
  end 
end
