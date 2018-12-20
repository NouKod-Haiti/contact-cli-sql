# require_relative "lib/contact"
# require_relative "lib/controllers"
require_relative 'config/environment'
Contact.create_table
menu = MenuController.new
system "clear"
puts "Welcome to my Address Book!"
menu.run
# binding.pry