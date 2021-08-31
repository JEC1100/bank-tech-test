require 'transaction'

describe Transaction do

  let(:transaction) { Transaction.new }

  describe '#initialize' do
    it 'starts with zero bal' do
      expect(subject.balance).to eq 0
    end
  end
end
