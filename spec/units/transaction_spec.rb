require 'transaction'

describe Transaction do
  date = Date.new(2017,11,27)
  let(:account_balance) { 2500 }
  subject(:transaction) { described_class.new(2000, date, account_balance) }

  it 'has an amount' do
    expect(transaction.amount).to eq(2000)
  end

  it 'has a date' do
    expect(transaction.date).to eq(date)
  end

  it 'contains the new account balance as a result of the transaction' do
    expect(transaction.account_balance).to eq(account_balance)
  end
end
