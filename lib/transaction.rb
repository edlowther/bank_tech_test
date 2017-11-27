class Transaction
  attr_reader :amount, :date, :account_balance
  def initialize(amount, date, account_balance)
    @amount = amount
    @date = date
    @account_balance = account_balance
  end
end
