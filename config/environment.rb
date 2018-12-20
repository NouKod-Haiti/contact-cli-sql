require 'bundler'
require 'bundler/setup'
Bundler.require

DB = {:conn => SQLite3::Database.new("db/contacts.db")}
  


require_all 'lib'

