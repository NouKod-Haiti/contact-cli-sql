class Controllers

  def run
    puts " "
    puts "Main Menu - You have  #{Contact.all.count} contact(s)".upcase.blue
    puts " "
    puts "1 - Add a contact"
    puts "2 - Display all contacts"
    puts "3 - Search for a contact"
    puts "4 - Exit"
    puts "5 - Display a contact"
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
      find_by_name
      run
    when 4
      puts "Are you sure you want to exit? (yes/no)".red
         input = gets.chomp
         if input == "n" || input == "N"
         run
         else
      puts "Goodbye 👋 👋 !!".blue
      exit(0)
      run
         end
        when 5
          display_a_contact
  else
      puts "🚫 #{selection} is not a valid input".red
      run
    end
  end

  def contacts_submenu
    puts "n - next contact"
    puts "d - delete all contacts"
    puts "a - delete a contact"
    puts "e - edit a contact"
    puts "r - return to main menu"

    selection = $stdin.gets.chomp.to_s

    case selection
    when "n"
    when "d"
      delete_all_contact
      contacts_submenu
    when "a"
      delete_contact
      contacts_submenu
    when "e"
      edit_contact
      contacts_submenu
    when "r"
      system "clear"
      run
    else
      system "clear"
      puts " '🚫' #{selection} is not a valid input".red
      contacts_submenu
    end
  end

  def search_submenu 
    puts "\na - delete this contact"
    puts "e - edit this contact"
    puts "r - return to main menu"

    selection = $stdin.gets.chomp.to_s

    case selection
    when "a"
      system "clear"
      delete_contact
      run
    when "e"
      edit_contact
      system "clear"
      puts "Contact updated "
      run
    when "r"
      system "clear"
      run
    else
      system "clear"
      puts "🚫 #{selection} is not a valid input"
      search_submenu
    end
  end

  def display_a_contact
    system "clear"
    Contact.all.each_with_index do |contact, index|
    system "clear"
    puts "Contact #{index + 1}".cyan
    puts''
    puts "----------------------------------------------------------------------" 
    puts "|ID |   FULL NAME    |    PHONE NUMBER    |  ADDRESS   | E - Mail |"
    puts "----------------------------------------------------------------------"
    puts "    "
    puts "| #{index + 1} | "+" #{contact.name} | "+"  #{contact.phone} | "+"  #{contact.address} | "+"  #{contact.email}"
    puts "----------------------------------------------------------------------"

    contacts_submenu
    end

    system "clear"
    puts "No more contacts"
    run
  end

 def display_all_contacts	   
    system "clear"
    puts "----------------------------------------------------------------------" 
    puts "|ID |   FULL NAME    |    PHONE NUMBER    |  ADDRESS   | E - Mail |"
    puts "----------------------------------------------------------------------"
    puts "    "
    Contact.all.each_with_index do |contact, index|    
    puts "| #{index + 1} | "+" #{contact.name} | "+"  #{contact.phone} | "+"  #{contact.address} | "+"  #{contact.email}"
    puts "----------------------------------------------------------------------"
    end	   
  end 

def edit_contact
    #display_all_contacts
    puts "Type the contact id to modify it!"
    input =  gets.chomp.to_i
    search = false
    Contact.all.each_with_index do |contact, index|
        if input == contact.id
            
          print "Updated name: "
           name = $stdin.gets.chomp
           until !name.empty?
           puts "Enter a name to continue!".red
           puts" "
           print "Name: "
           name = $stdin.gets.chomp
         end
            
           print "Updated phone: "
           phone = $stdin.gets.chomp
           until !phone.empty? && (phone[/\d{11}/])
           puts "Enter a phone to continue!".red
           puts" "
           print "Phone: "
           phone = $stdin.gets.chomp
         end
           print "Updated address: "
           address = $stdin.gets.chomp
           until !address.empty?
           puts "Enter an address to continue!".red
           puts" "
           print "Address: "
           address = $stdin.gets.chomp
         end
           print "Updated e-mail: "
           email = $stdin.gets.chomp
           until email.end_with?(".com") && email.include?("@") || email.end_with?(".fr") && email.include?("@") || email.end_with?(".ht") && email.include?("@") && !email.empty?
           puts "Enter an e-mail to continue!".red
           puts" "
           print "Email: "
           email = $stdin.gets.chomp
         end
            #Contact.create(name: name, phone: phone, address: address, email: email)
            newInfo = Contact.new contact.id, name, phone, address, email
            newInfo.update
            puts "Contact id #{input} has been modified!\n".blue
            puts "\nThe new contact is:\n\Full Name: #{newInfo.name}, Phone: #{newInfo.phone}, Address #{newInfo.address}, Email: #{newInfo.email}"
            search = true
          end
      end
      until search == true
         puts "'#{input}' is not in your contact!\n"
         edit_contact
      end
      
  end

  def delete_all_contact
    puts "Are you sure you want to delete all your contacts? (yes/no)".red
    input = gets.chomp
    if input == "y" || input == "Y" || input == "yes"
    Contact.delete_only_data
    puts "Your contact list is empty".blue
    else
    contacts_submenu  
    end  
  end


def delete_contact 
        
  puts "\n Type the id contact to delete it!"
  input = gets.chomp.to_i
  search = false
  
  Contact.all.each_with_index do |contact, index|     
      if contact.id == input
          Contact.drop_row input
          search = true
      end
      puts "Contact id #{input} has been deleted!\n".blue
      
  end

  until search == true
      puts "'#{input}' is not in your contact!\n"
     return delete_contact
   end
  
end

  def add_contact
    system "clear"
    puts "New Contact"
    print "Name: "
    name = $stdin.gets.chomp
    until !name.empty?
    puts "Enter a name to continue!".red
    puts" "
    print "Name: "
    name = $stdin.gets.chomp
    end
    print "Phone: "
    phone = $stdin.gets.chomp
    until !phone.empty? && (phone[/\d{11}/])
    puts "Enter a valid phone to continue!".red
    puts" "
    print "Phone: "
    phone = $stdin.gets.chomp
    end
    print "Address: "
    address = $stdin.gets.chomp
    until !address.empty?
    puts "Enter an address to continue!".red
    puts" "
    print "Address: "
    address = $stdin.gets.chomp
    end
    print "Email: "
    email = $stdin.gets.chomp
    until email.end_with?(".com") && email.include?("@") || email.end_with?(".fr") && email.include?("@") || email.end_with?(".ht") && email.include?("@") && !email.empty?
    puts "Enter a valid e-mail to continue!".red
    puts" "
    print "Email: "
    email = $stdin.gets.chomp
    end

    Contact.create(name: name, phone: phone, address: address, email: email)

    system "clear"
    puts "New contact added successfully".cyan
  end
puts "Contact Created successfully!".cyan
 

def find_by_name
  system "clear"
  puts""
  puts "Search by name:"
  input = gets.chomp.to_s
  search = false
  Contact.all.each_with_index do |contact, index|
     
      if input == contact.name
      puts "Contact #{index + 1}".cyan
      puts "----------------------------------------------------------------------" 
      puts "|ID |   FULL NAME    |    PHONE NUMBER    |  ADDRESS   | E - Mail |"
      puts "----------------------------------------------------------------------"
      puts "| #{index + 1} | "+" #{contact.name} | "+"  #{contact.phone} | "+"  #{contact.address} | "+"  #{contact.email}"
      puts "----------------------------------------------------------------------" 
          search_submenu
          search = true
      end 
  end
 else#if !search
      puts "'#{input}' is not in your contact list!\n".red
      find_by_name
  #end
end
end