require 'mongo'
include Mongo

db = Connection.new.db('ledger')
bal = db['balances']
trans=db['transactions']

trans.find().each{|item|
p item
}