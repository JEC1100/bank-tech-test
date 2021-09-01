require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  describe Statement do
    context 'a new instance of statement stores an empty array' do
      it 'can store transaction history' do
        expect(statement.store).to eq([])
      end
    end
  end
end
