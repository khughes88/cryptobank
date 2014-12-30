require 'mongo'
include Mongo

db = Connection.new.db('ledger')
bal = db['balances']
trans=db['transactions']

trans.remove()
bal.remove()

bal.insert({:wallet=>'bob', :firstname => 'Bob', :surname => 'Test',:password => 'password', :balance => 100, :elec_balance => 95000 })
bal.insert({:wallet=>'alice', :firstname => 'Alice', :surname => 'Test',:password => 'password', :balance => 100, :elec_balance => 95000 })
bal.insert({:wallet=>'keith', :firstname => 'Keith', :surname => 'Hughes',:password => 'password', :balance => 100, :elec_balance => 95000 })
bal.insert({:wallet=>'alex', :firstname => 'Alex', :surname => 'McMahon',:password => 'password', :balance => 100, :elec_balance => 95000 })
bal.insert({:wallet=>'coffee', :firstname => 'Costa', :surname => 'Coffee',:password => 'password', :balance => 100, :elec_balance => 95000 })