require 'sqlite3'
DB = {:conn => SQLite3::Database.new("db/contacts.db")}
  
require 'bundler'

require_relative 'lib/contact.rb'

require_relative '../lib/controllers.rb'
require 'colorize'
require_relative '../lib/menu.rb'
require_relative '../lib/main.rb'
require 'pry'

AddressBook.new