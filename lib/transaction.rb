class Transaction
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def invalid?(input)
    input.is_a?(Float) || input.is_a?(Integer) == false
  end

  def deposit(amount)
    unless invalid?(amount)
      @balance += amount
    else raise 'Invalid input'
    end
  end

  def withdraw(amount)
    if @balance > amount
      @balance -= amount
    else raise 'Insufficient funds'
    end
  end
end

