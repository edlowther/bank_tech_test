require 'statement'

describe Statement do
  let(:withdrawal) { double(:transaction,
    :amount => 30,
    :date => Date.new(2017,5,4),
    :account_balance => 1970,
    :type => :withdrawal)
  }
  let(:deposit) { double(:transaction,
    :amount => 50,
    :date => Date.new(2017,5,6),
    :account_balance => 2020,
    :type => :deposit)
  }
  let(:transactions) { [withdrawal, deposit] }
  subject(:statement) { described_class.new(transactions) }

  it 'prints the specified column headers' do
    expect(statement.print).to include("date || credit || debit || balance")
  end

  it 'prints a withdrawal correctly' do
    expect(statement.print).to include("04/05/2017 || || 30.00 || 1970.00")
  end

  it 'prints a deposit correctly' do
    expect(statement.print).to include("06/05/2017 || 50.00 || || 2020.00")
  end

end
