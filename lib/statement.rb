require_relative 'transaction'

class Statement < Transaction
  attr_accessor :transactions

  def initialize(transactions = [])
    @transactions = transactions
  end

  def store
    @transactions
  end

  def update(add)
    @transactions << add
  end
end
