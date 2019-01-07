 require 'sqlite3'
 require_relative '../lib/address.rb'
# # require_relative '../config/environment.rb'
  require_relative '../lib/contact.rb'
# require_relative '../bin/call.rb'
# # require 'pry'
# # binding.pry


 #DB = {:conn => SQLite3::Database.new("../db/contacts.db")}

require 'bundler'
require 'bundler/setup'
Bundler.require

DB = {:conn => SQLite3::Database.new("db/contacts.db")}
  


#require_all 'lib'


