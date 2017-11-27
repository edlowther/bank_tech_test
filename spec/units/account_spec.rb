require 'account'

describe Account do
  let(:transaction_class) { double(:transaction_class, :new => transaction) }
  let(:transaction) { double(:transaction) }

  subject(:account) { described_class.new(2000, transaction_class) }

  it 'can be initialized with a starting deposit' do
    expect(account.balance).to eq 2000
  end

  it 'allows withdrawals' do
    expect { account.withdraw(500) }.to change { account.balance }.by(-500)
  end

  it 'enables deposits' do
    expect { account.deposit(1000) }.to change { account.balance }.by(1000)
  end

  describe 'transaction history' do
    it 'keeps track of the dates of transactions' do
      transaction_date = Date.new(2017,3,2)
      allow(transaction).to receive(:date).and_return(transaction_date)
      account.withdraw(20, transaction_date)
      expect(account.transactions.last.date).to eq(transaction_date)
    end
  end
end
