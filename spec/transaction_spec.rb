require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  context '#initialize' do
    it 'starts with zero bal' do
      expect(transaction.balance).to eq 0.00
    end

    it 'only accepts floats or integers' do
      expect { transaction.deposit('Donkey') }.to raise_error 'Invalid input'
    end
  end

  context '#deposit' do
    it 'increases balance by deposited amount' do
      expect { transaction.deposit(200) }.to change { transaction.balance }.by 200.00
    end
  end

  context '#withdraw' do
    it 'reduces balance by amount withdrawn amount' do
      transaction.deposit(200)
      expect { transaction.withdraw(90) }.to change { transaction.balance }.by(-90.00)
    end

    it 'only reduces balance by amount withdrawn if sufficient funds' do
      transaction.deposit(200)
      expect { transaction.withdraw(220) }.to raise_error 'Insufficient funds'
    end
  end

  context '#statement' do
    it 'prints statement of historic transactions' do
            expect { transaction.statement }.to output{
              "date:     | credit:  | debit:   | balance: |\n02/09/2021|200.00    |90.00     |110.00    |\n"
    }.to_stdout
    end
  end
   

end


# context '#statement' do
#   it 'prints statement of historic transactions' do
#           expect { menu.print_statement([{ date: '02/09/2021', credit: 200, debit: 90, balance: 110 }]) }.to output(
#             "date:     | credit:  | debit:   | balance: |\n02/09/2021|200.00    |90.00     |110.00    |\n"
#           ).to_stdout
#   end
# end