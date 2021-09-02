require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  # Date.today = 01/09/2021

  let(:Date.today) {Date.today = '01/09/2021'}

  context 'a new instance of statement stores a zero balance' do
    it 'can store transaction history' do
      expect(statement.store).to eq([0])
    end
  end

  context '#update' do
    it 'a deposit has the effect of pushing new increased balance into array' do
      statement.update(200)
      expect(statement.store).to eq([200])
    end
    it 'a withdrawal has the effect of pushing a new reduced balance into array' do
      statement.update(200)
      statement.update(-50)
      expect(statement.store).to eq([150])
    end
  end

  context '#datestamp' do
    it 'it stamps each transaction with the transaction date' do
      statement.update(200).datestamp(Date.today)
      expect(statement.store).to_be timestamped_with(Date.today)
    end
  end
end
