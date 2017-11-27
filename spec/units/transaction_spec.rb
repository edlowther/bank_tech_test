require 'transaction'

describe Transaction do
  date = Date.new(2017,11,27)
  subject(:transaction) { described_class.new(2000, date) }
  
  it 'has an amount' do
    expect(transaction.amount).to eq(2000)
  end

  it 'has a date' do
    expect(transaction.date).to eq(date)
  end
end
