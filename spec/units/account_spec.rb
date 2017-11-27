require 'account'

describe Account do
  subject(:account) { described_class.new(2000) }

  it 'can be initialized with a starting deposit' do
    expect(account.balance).to eq 2000
  end

  it 'allows withdrawals' do
    expect { account.withdraw(500) }.to change { account.balance }.by(-500)
  end

  it 'enables deposits' do
    expect { account.deposit(1000) }.to change { account.balance }.by(1000)
  end
end
