class Transaction
  attr_reader :amount, :date, :account_balance, :type
  def initialize(amount, date, account_balance, type)
    @amount = amount
    @date = date
    @account_balance = account_balance
    @type = type
  end
end
