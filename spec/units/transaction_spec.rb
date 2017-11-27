require 'transaction'

describe Transaction do
  date = Date.new(2017,11,27)
  let(:account_balance) { 2500 }
  subject(:transaction) { described_class.new(2000, date, account_balance, :deposit) }

  it 'has an amount' do
    expect(transaction.amount).to eq(2000)
  end

  it 'has a date' do
    expect(transaction.date).to eq(date)
  end

  it 'contains the new account balance as a result of the transaction' do
    expect(transaction.account_balance).to eq(account_balance)
  end

  it 'knows if it is a deposit' do
    deposit = described_class.new(50, date, account_balance, :deposit)
    expect(deposit.type).to eq(:deposit)
  end

  it 'knows if it is a withdrawal' do
    deposit = described_class.new(50, date, account_balance, :withdrawal)
    expect(deposit.type).to eq(:withdrawal)
  end
end
