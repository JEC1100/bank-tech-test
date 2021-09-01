require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  context 'a new instance of statement stores an empty array' do
    it 'can store transaction history' do
      expect(statement.store).to eq([])
    end
  end

  context '#update' do
    it 'a deposit has the effect of pushing new balance into array' do
      statement.update(200)
      expect(statement.store).to eq([200])
    end
  end
end
