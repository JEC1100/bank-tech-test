# frozen_string_literal: true

require 'statement'
require 'timecop'

describe Statement do
  let(:statement) { Statement.new }

  before(:each) do
    Timecop.freeze(2021, 9, 3)
  end

  context 'a new instance of statement stores a zero balance' do
    it 'can store transaction history' do
      expect(statement.credit_transaction(0, 0)).to eq([{:balance=>0, :credit=>0, :date=>"2021-09-03", :debit=>0}])
    end
  end

  context '#credit_transaction' do
    it 'a deposit has the effect of pushing credit into array' do
      expect(statement.credit_transaction(200, 0)).to eq([{:balance=>0, :credit=>200, :date=>"2021-09-03", :debit=>0}])
    end
  end

  context '#debit_transaction' do
    it 'a withdrawal has the effect of pushing debit into array' do
      statement.credit_transaction(200, 0)
      expect(statement.debit_transaction(50, 200)).to eq([{:balance=>0, :credit=>200, :date=>"2021-09-03", :debit=>0}, {:balance=>200, :credit=>0, :date=>"2021-09-03", :debit=>50}])
    end
  end

  context 'ensures each transaction is paired with a date' do
    it 'it stamps each transaction with the transaction date' do
      statement.credit_transaction(0, 0)
      expect(statement.date).to eq('03/09/2021') 
    end
  end

  context '#display' do
    it 'it displays statement' do
      statement.credit_transaction(0, 0)
      expect { statement.display } .to output {
                    "date:     | credit:  | debit:   | balance: |\n02/09/2021|200.00    |90.00     |110.00    |\n"
      } .to_stdout
    end
  end
end

