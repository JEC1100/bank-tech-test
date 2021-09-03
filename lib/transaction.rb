# frozen_string_literal: true
# Acts on all user requests made in ruby REPL interface

require_relative 'statement'

class Transaction
  attr_reader :balance, :statement

  def initialize
    @balance = 0.00
    @statement = Statement.new
  end

  def invalid?(input)
    input.is_a?(Float) || input.is_a?(Integer) == false
  end

  def deposit(amount)
    raise 'Invalid input' if invalid? amount

    @balance += amount
    @statement.debit_transaction(amount, @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
    @statement.credit_transaction(amount, @balance)
  end

  def statement
  
    @statement.display
  end
end
