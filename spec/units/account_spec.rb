require 'account'

describe Account do
  let(:transaction_class) { double(:transaction_class, :new => transaction) }
  let(:transaction) { double(:transaction) }

  let(:statement_class) { double(:statement_class, :new => statement) }
  let(:statement) { double(:statement) }

  subject(:account) { described_class.new(2000, transaction_class, statement_class) }

  it 'can be initialized with a starting deposit' do
    expect(account.balance).to eq 2000
  end

  it 'otherwise defaults to a deposit of zero' do
    expect(described_class.new.balance).to eq(0)
  end 

  it 'allows withdrawals' do
    expect { account.withdraw(500) }.to change { account.balance }.by(-500)
  end

  it 'enables deposits' do
    expect { account.deposit(1000) }.to change { account.balance }.by(1000)
  end

  context 'transaction history' do

    describe 'withdrawals' do
      let(:withdrawal_amount) { 20 }
      let(:withdrawal_date) { Date.new(2017,3,2) }

      before(:each) do
        allow(transaction).to receive(:date).and_return(withdrawal_date)
        allow(transaction).to receive(:amount).and_return(withdrawal_amount)
        account.withdraw(withdrawal_amount, withdrawal_date)
      end

      it 'keeps track of dates' do
        expect(account.transactions.last.date).to eq(withdrawal_date)
      end

      it 'keeps track of amounts' do
        expect(account.transactions.last.amount).to eq(withdrawal_amount)
      end
    end

    describe 'deposits' do
      let(:deposit_amount) { 50 }
      let(:deposit_date) { Date.new(2017,8,7) }

      before(:each) do
        allow(transaction).to receive(:date).and_return(deposit_date)
        allow(transaction).to receive(:amount).and_return(deposit_amount)
        account.deposit(deposit_amount, deposit_date)
      end

      it 'keeps track of dates' do
        expect(account.transactions.last.date).to eq(deposit_date)
      end

      it 'keeps track of amounts' do
        expect(account.transactions.last.amount).to eq(deposit_amount)
      end
    end

    it 'delegates printing to statement dependency' do
      expect(statement).to receive(:print)
      account.print_statement
    end

  end


end
