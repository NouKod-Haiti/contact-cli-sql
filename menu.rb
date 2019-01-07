
require_relative 'config/environment'

Contact.create_table
menu = Controllers.new
system "clear"
puts "    
------------------------------
Welcome to my contacts Library
------------------------------".upcase.yellow
menu.run
# binding.pry