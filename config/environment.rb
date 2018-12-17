require "pry"
# require 'sqlite3'
# require 'bundler'
# DB = {:conn => SQLite3::Database.new("db/contact.db")}
# # Bundler.require

# require_relative '../lib/address'
require_relative '../lib/create_contact'

# # require_relative '../lib/contact_sql'

require 'sqlite3'
require 'bundler'


DB = {:conn => SQLite3::Database.new("db/contact.db")}
DB[:conn].execute("DROP TABLE IF EXISTS contacts")
sql = <<-SQL
CREATE TABLE IF NOT EXISTS contacts (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  person_address Text,
  email Text,
  phone Integer
  )
SQL

DB[:conn].execute(sql)
DB[:conn].results_as_hash = true

binding.pry