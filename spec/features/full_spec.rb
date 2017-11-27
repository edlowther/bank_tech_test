require 'account'

describe 'App usage' do
  it 'satisfies the requirements as specified' do
    account = Account.new(0)
    account.deposit(1000, Date.new(2012,1,10))
    account.deposit(2000, Date.new(2012,1,13))
    account.withdraw(500, Date.new(2012,1,14))
    expect(account.print_statement).to eq("date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00")
  end
end
