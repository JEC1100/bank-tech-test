# frozen_string_literal: true
# Builds, formats, makes accessible, a repsonse to #print_statement in Transaction class

require_relative 'transaction'



class Statement 
  attr_reader :transactions, :date

  TABLETOP = "date || credit || debit || balance\n"
  DATESTAMP = Time.new.to_s.slice(0..9).delete('"')


  def initialize
    @transactions = []
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def credit_transaction(amount, balance)
    @transactions << {date: DATESTAMP, credit: amount, debit: 0, balance: balance}
  end

  def debit_transaction(amount, balance)
    @transactions << { date: DATESTAMP, credit: 0, debit: amount, balance: balance }
  end


  def write_to_statement(statement)
    @transactions.each do |x|
      x_data = [x[:date], x[:credit],
                          x[:debit], x[:balance]]
      statement_line = x_data.join(',')
      statement.print(statement_line)
    end
  end

def read_from_statement(statement)
  statement.readlines.each do |line|
    date, credit, debit, balance = line.chomp.split(',')
    @transactions <<
      { date: date, credit: credit.to_f, debit: debit.to_f, balance: balance.to_f }
    end
  end
  
    def print_statement(historic_transactions)
      table_rows = historic_transactions.reverse.map do |exchanges|
        format_table_row(exchanges)
      end
      puts TABLETOP + table_rows.join("\n")
    end

    def display
      print TABLETOP + @transactions.map { |row| format_table_row(row) }.join("\n")
    end
  
  
  private
  
  def format_table_row(row)
  "#{row[:date]}||#{format_field_value(row[:credit])}||#{format_field_value(row[:debit])}||#{format_field_value(row[:balance])}||"
  end
  
  def format_field_value(value)
    if value != 0
      value = ' ' + format('%.2f', value).to_s + ' '
    else 
      value = " "
    end
  end
end
