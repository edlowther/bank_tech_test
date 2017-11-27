require 'account'

describe Account do
  it 'can be initialized with a starting deposit' do
    account = Account.new(2000)
    expect(account.balance).to eq 2000
  end
end
