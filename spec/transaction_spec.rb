require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  context '#initialize' do
    it 'starts with zero bal' do
      expect(transaction.balance).to eq 0
    end
  end
  context '#deposit' do
    it 'increases balance by deposited amount' do
      expect {transaction.deposit(200)}.to change {transaction.balance }.by 200
    end
  end
  context '#withdraw' do
    it 'reduces balance by amount withdrawn amount' do
      transaction.deposit(200)
      expect {transaction.withdraw(90)}.to change {transaction.balance }.by -90
    end
  end
end