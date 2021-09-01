class Transaction
  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def invalid?(input)
    input.is_a?(Float) || input.is_a?(Integer) == false
  end

  def deposit(amount)
    raise 'Invalid input' if invalid? amount

    @balance += amount
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
  end
end
