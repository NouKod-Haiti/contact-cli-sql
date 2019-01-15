

require_relative 'config/environment'

Contact.create_table
main = Address.new
system "clear"
puts "    
--------------------------------
Welcome to my contacts List App
--------------------------------
  ".upcase

main.call
