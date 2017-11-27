class Statement
  def initialize(transactions)
    @transactions = transactions
  end

  def print
    result = "date || credit || debit || balance"
    @transactions.each do |transaction|
      result += "\n"
      result += transaction.date.strftime('%d/%m/%Y') + " || "
      if transaction.type == :deposit
        result += "#{'%.2f' % transaction.amount}" + " || || "
      elsif transaction.type == :withdrawal
        result += "|| " + "#{'%.2f' % transaction.amount}" + " || "
      end
      result += "#{'%.2f' % transaction.account_balance}"
    end
    result
  end
end
