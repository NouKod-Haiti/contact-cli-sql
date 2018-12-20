# require_relative "../lib/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def run
    puts " "
    puts "Main Menu - #{Contact.all.count} contacts"
    puts " "
    puts "1 - Add a contact"
    puts "2 - Display all contacts"
    puts "3 - Search for a contact"
    puts "4 - Import contacts from a CSV"
    puts "5 - Exit"
    puts " "
    print "Enter your selection: "

    selection = $stdin.gets.chomp.to_i

    case selection
    when 1
        add_contact
        run
    when 2
      display_all_contacts
      run
    when 3
      system "clear"
      search_contacts
      run
    when 4
      read_csv
      run
    when 5
      puts "Are you sure you want to exit? (yes/no)"
         input = gets.chomp
         if input == "n" || input == "N"
         run
         else
      puts "Good-bye!"
      exit(0)
      run
         end
    else
      puts "#{selection} is not a valid input"
      run
    end
  end

  def contacts_submenu(contact)
    puts "n - next contact"
    puts "d - delete contact"
    puts "e - edit this contact"
    puts "r - return to main menu"

    selection = $stdin.gets.chomp

    case selection
    when "n"
    when "d"
      delete_contact(contact)
    when "e"
      edit_contact(contact)
      contacts_submenu(contact)
    when "r"
      system "clear"
      run
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts contact.to_s
      contacts_submenu(contact)
    end
  end

  def search_submenu(contact)
    puts "\nd - delete contact"
    puts "e - edit this contact"
    puts "r - return to main menu"

    selection = $stdin.gets.chomp

    case selection
    when "d"
      system "clear"
      delete_contact(contact)
      run
    when "e"
      edit_contact(contact)
      system "clear"
      puts "Updated Contact"
      run
    when ""
      system "clear"
      run
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts contact.to_s
      search_submenu(contact)
    end
  end

  def display_all_contacts
    system "clear"

    Contact.all.each_with_index do |contact, index|
      system "clear"
      puts "Contact #{index + 1}"
      puts contact.name
      contacts_submenu(contact)
    end

    system "clear"
    puts "End of contacts"
  end
def edit_contact(contact)
    print "Updated name: "
    name = $stdin.gets.chomp
    print "Updated phone: "
    phone = $stdin.gets.chomp
    print "Updated address: "
    address = $stdin.gets.chomp
    print "Updated email: "
    email = $stdin.gets.chomp

    contact.name = name if !name.empty?
    contact.phone = phone if !phone.empty?
    contact.address = address if !address.empty?
    contact.email = email if !email.empty?

    puts "Updated contact:"
    puts contact
  end

  def delete_contact(contact)
    @address_book.contacts.delete(contact)
    puts "#{contact.name} has been deleted"
  end

  def add_contact
    system "clear"
    puts "New Contact"
    print "Name: "
    name = $stdin.gets.chomp
    print "Phone: "
    phone = $stdin.gets.chomp
    print "Address: "
    address = $stdin.gets.chomp
    print "Email: "
    email = $stdin.gets.chomp

    Contact.create(name: name, phone: phone, address: address, email: email)

    system "clear"
    puts "New contact added"
  end

#   if Contact.create_table == true
#      Contact.create(name:name, phone:phone, address:address, email:email) 
#   else
#     Contact.create_table
#     Contact.create(name:name, phone:phone, address:address, email:email) 
  
#  end
 puts "Contact Created successfull!"
def find_match(name) 
    @address_book.search(name)
  end

  def search_contacts
    print "Search by name: "
    name = $stdin.gets.chomp
    match = Contact.find_by_name(name)

    if match
      $stdout.print match.name 
      search_submenu(match)
    else
      $stdout.print "No match found\n"
    end
  end

  def read_csv
    $stdout.print "Enter CSV file to import: "
    file_name = $stdin.gets.chomp

    if file_name.empty?
      system "clear"
      $stdout.print "No CSV file read"
      run
    end

    begin
      @address_book.add_from_csv(file_name)
    rescue
      $stdout.print "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end
end

