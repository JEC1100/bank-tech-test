require 'transaction'

describe Transaction do

  let(:transaction) { Transaction.new }

  describe '#initialize' do
    it 'starts with zero bal' do
      expect(transaction.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'increases bal by deposited amount' do
      expect {transaction.deposit(200)}.to change {transaction.balance }.by(200)
    end
  end
end