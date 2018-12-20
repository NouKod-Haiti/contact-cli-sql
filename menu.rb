require_relative "lib/contact"
require_relative "lib/controllers"


menu = MenuController.new
system "clear"
puts "Welcome to my Address Book!"
menu.run