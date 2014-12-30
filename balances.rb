require 'mongo'
include Mongo

db = Connection.new.db('ledger')
bal = db['balances']


bal.find().each{|item|
p item
}