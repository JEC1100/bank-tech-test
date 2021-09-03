# Bank Tech Test

- Makers
- Tech Test 1
- Ruby program
- Simulates behaviour of a bank account from account holder point-of-view
- User can open a new (empty by default) account and perform transactions

## How to use this program

1. Clone this repo by selecting the green code button’s dropdown box and clicking copy and then enter the following command in the terminal of your machine:

````
git clone <copied link>
````

2. Change into this project directory and run the following command in the terminal:

````
bundle
````

3. To run tests and test coverage report, enter the following in the terminal:

````
rspec
````

4. Open IRB or PRY in the terminal and type:

````
Require “./lib/transaction”
=> true
````

5. To create a new bank account and see its balance, type:

````
transaction = Transaction.new
=> #<Transaction:0x00007fb5e217b318 @balance=0.0>
````

6. Since the default balance on opening an account is always zero, your first transaction cannot be a withdrawal, unless that withdrawal equals 0.

7. To deposit into the account, for example £11, enter:

 ````
transaction.deposit(11)
=> 11.0
````

8. To withdraw from the account, for example £2, enter:

 ````
transaction.withdraw(2)
=> 9.0
````

9. To view a formatted statement of all past transactions, enter:

````
transaction.statement
=> date    || credit  || debit  || balance
02/09/2021 ||   11.00 ||        ||   11.00
02/09/2021 ||         ||   2.00 ||    9.00
````

10. To close the account, in IRB, hit keys Ctrl + D or Ctrl + Z. To close the account, in PRY, type “q” and hit enter.

## Approach

0. I envisioned a single BankAccount class first, with extraction in mind.
1. It quickly became apparent BankAccount deals with the user transactions.
2. As such, I set out with two classes in mind: Transaction and Statement.
3. I extrapolated user stories (above) from the tech test criteria (below).
4. I based user functionality on those stories methodically testing in IRB.
5. I was led purely by TDD in the smallest incremental steps of complexity.
6. I made meaningful git commits and pushed to main with each passing test.
7. I refactored as I went along in a disciplined red-green-refactor loop.
8. I also ran the code through a linter, to consider its style suggestions.
9. I began Transaction with deposit functionality as new balances are zero.
10. I prefaced withdraw method with guard clause to prevent minus balances.
11. I created hashes to marry date-stamps to for each of the transactions.
12. I pushed those hashes into a new array to produce a new statement line.
13. Formatting was taken care of by Statement and accessed by Transaction.
14. I used lets and doubles to make testing viable for all these functions.
15. I removed unnecessary comments, code, and idle git branches throughout.
16. I narrowed down core edge cases to invalid input and absent statements.
17. I tackled edge cases: preventing negative integer and non-numeric input
18. I used Rubocop, SimpleCov, Rspec, VSCode and several VSCode extensions.
19. I monitored that test coverage was 100% throughout development testing.
20. I chose to git ignore all JSON test coverage files when making commits.
21. I constantly tested progress in IRB, to identify missing functionality.
22. I imagined a menu style selection interface for transactions, overdraft facilities, messages to inform the user of their most recent transaction as added security measures but these were - not asked for – overcomplications.

## User Stories

````
As a Customer,
So that I can store my earnings, 
I want to create a bank account which can store that value
````

````
As a Customer,
So that I don’t apportion value I don’t have and risk being fined,
I want to be denied any withdrawals over the amount exceeding my deposits
````

````
As a Customer,
So I can keep on top of my finances,
I want to see my balance every time I make a transaction
````

````
As a Customer,
So I can store my money in a safe place,
I want to be able to deposit any value amount into my account
````

````
As a Customer,
So I can exchange my value in other places,
I want to be able to make value withdrawals from my account
````

````
As a Customer,
So I can guard against suspicious activity and watch my spending,
I want to be able to print a statement of all my recent transactions
````

## Further suggestions for User Stories

````
As the Service Provider,
So that we don’t inconvenience customers,
I want to afford customers the withdrawal of value they do not have
````

````
As the Service Provider,
So that we don’t go bankrupt,
I want to charge fees and interest to customers using an overdraft facility 
````

## The specification for this tech is test described below

## Bank tech test criteria

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)

- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

````
## CRC cards and Domain Models
![Transaction CRC card]( https://github.com/JEC1100/bank-tech-test /blob/main/images/account.png)
![Statement CRC card]( https://github.com/JEC1100/bank-tech-test /blob/main/images/transaction.png)
## Application in use
An example of the program being used in IRB (a Ruby REPL).
![Running App]( https://github.com/JEC1100/bank-tech-test /blob/main/images/running_app.png)
