## Bank tech test

The aim of this test is to write a programme that simulates a bank account, enabling a user to keep track of their balance while withdrawing or depositing money.

For simplicity, the bank is not required to connect to a database, so all transactions are stored in memory and will be lost at the end of the session. It is also not required to make a web interface for the application - users will interact with it via the command line.

## User stories

```
As a customer
So I can keep my money safe
I need to be able to create a bank account
```

```
As a customer
So I can spend money on things I want to buy
I need to be able to withdraw money
```

```
As a customer
So I can save money for future purchases
I need to be able to deposit money
```

```
As a customer
So I can keep track of my financial situation
I need to be able to see an account statement
```

## How to use

Clone repository and run the following commands in the project root directory to test it:

```
bundle
rspec
```

To access the application, start a Ruby REPL, e.g. IRB, and enter:

```ruby
require './lib/account'
```

Accounts can now be created either with a starting deposit or without (in which case the starting balance defaults to zero):

```ruby
account = Account.new(1000)
account = Account.new
```

Transactions can be made via the 'deposit' and 'withdraw' methods as follows:

```ruby
account.deposit(300)
account.withdraw(250)
```

The transaction history can be seen in the terminal using puts and the print_statement method:

```ruby
puts account.print_statement
```

## Approach

I wrote some user stories and designed a simple way to meet their requirements, centred around the Account class. I test-drove every part of the application, and iterated on the design when necessary, e.g. when I realised the transactions would need to be able to reveal to the printer class whether they were deposits or withdrawals.

I tried to ensure that I stuck to good separation of concerns, keeping the presentation layer separate from the business logic using the Statement class.  

And I used dependency injection to make it easier to test using doubles, and to adapt the application should future requirements change.

Given more time, I would connect the application to a database to persist account data, and enable users to interact with it via a web interface. 
