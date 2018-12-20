
require_relative 'config/environment'
Contact.create_table
menu = MenuController.new
system "clear"
puts "Welcome to my list of contact!".upcase.yellow
menu.run
# binding.pry