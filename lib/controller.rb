#require 'pry'
class Controller
     
    def add_contact
        system('clear')
        puts "Create a new Contact!\n"
        puts" "
        puts "Enter the contact Fullname:"
        name = gets.chomp
        until !name.empty? 
            puts "\nPlease enter a valide name.".red
            sleep(1)
            puts "Enter the contact Fullname"
            name = gets.chomp

        end

        puts "Enter an address:"
        address = gets.chomp
        until !address.empty?
            puts "\nPlease enter a valide address.".red
            sleep(1)
            puts "Enter an address"
            address = gets.chomp 
        end

        puts "Enter an e-mail:"
        email = gets.chomp
        until !email.empty? 
            puts "\nPlease enter a valide e-mail.".red
            sleep(1)
            puts "Enter an e-mail"
            email = gets.chomp
        end
    
       
        puts "Enter a phone Number:"
        phone_number = gets.chomp
        until !phone_number.empty? 
            puts "\nPlease enter a valide phone number.".red
            sleep(1)
            puts "Enter a phone Numberr"
            phone_number = gets.chomp
        end

         if Contact.create_table == true
            Contact.create(name:name, phone_number:phone_number, address:address, email:email) 
         else
            Contact.create_table
            Contact.create(name:name, phone_number:phone_number, address:address, email:email) 
        end
       
       puts "The contact has been created successfully!" 
    end 
   
     def display_all_contacts
        system("clear") 
        Contact.all.each do |contact|
           puts "#{contact.join ", "}\n"
        end
    end     
 
    def delete_a_contact 
        display_all_contacts
        puts "\n Enter the id of the contact you want to delete!"

        input = gets.chomp.to_i
        Contact.all.each do |contactc|
             Contact.drop_row input if contactc[0] == input
        end
      
        puts "The contact id #{input} has been deleted!\n"
        display_all_contacts
        Menu.new.option
        
    end

    def exit
        puts "Do you really want to exit the program? yes or no".red
        input = gets.chomp
        if input =='y' || input =='yes'
             Contact.drop_table
             puts "Bye!"
             system('clear')
             show
        else
            Menu.new.option
        end
    end


    def modify_contact
        display_all_contacts
        puts "Please, Enter the contact id you want to modify!"
        modify =  gets.chomp.to_i
        Contact.all.each do |contactc|
            if modify == contactc.first
                
                puts "Enter the new Name"
                name = gets.chomp.capitalize
                until !name.empty? 
                    name = gets.chomp
                end
                
                puts "Enter the new e-mail"
                email = gets.chomp.downcase
                until !email.empty? 
                    email = gets.chomp
                end
               
                puts "Enter the new phone number"
                phone_number = gets.chomp.to_i
                until !phone_number.empty? 
                    phone_number = gets.chomp.to_i
                end
                
                puts "Enter the new Address" 
                address = gets.chomp.capitalize
                until !address.empty? 
                    address = gets.chomp
                end
                
                ncontact = Contact.new contact_column.first, name, phone_number, address, email
                ncontact.update
                system('clear')
                puts "The contact id #{modify} has been modified!"
                puts "\nYour new contact is:Name: #{ncontact.name}, Phone: #{ncontact.phone_number}, Address #{ncontact.address}, Email: #{ncontact.email}"
            end
        end
        Menu.new.option
    end

     def alter_phone_number
        display_all_contacts
        puts "Enter the id of the contact phone number you want to modidy"
       input = gets.chomp.to_i

        Contact.all.each do |contact_column|
            if input == contact_column[0]
                puts "Enter the new phone number."
                new_phone_number = gets.chomp.to_i
                Contact.update_phone_number input, new_phone_number
                puts "#{contact_column[1]}'s phone Number has been successfully modify!"
            end
        end
        Menu.new.option
    end

    def alter_email
        display_all_contacts
        puts "Enter the id of the contact you want to modify"
        input = gets.chomp.to_i

        Contact.all.each do |contact_column|
            if input == contact_column[0]
                puts "Enter the new email."
                new_email = gets.chomp
                Contact.update_email input, new_email
                puts "#{contact_column[1]}'s email has been successfully modify."
            end
        end
        Menu.new.option
    end

    def alter_name
        system('clear')
        display_all_contacts
        puts "Enter the id of the contact you want to modify"
        input = gets.chomp.to_i

        Contact.all.each do |contact_column|
            if input == contact_column[0]
                puts "Enter the new name."
                new_name = gets.chomp
                puts ""
                Contact.update_name input, new_name
                puts "#{contact_column[0]}' name has been modify successfully."
                sleep(2)
            end
        end
        system('clear')
        Menu.new.option
    end

    def alter_address
        display_all_contacts
        puts "Enter the id of the contact you want to modidy"
        input_id = gets.chomp.to_i

        Contact.all.each do |contact_column|
            if input == contact_column[0]
                puts "Enter the new address."
                new_address = gets.chomp
                Contact.update_phone_number input, new_address
                puts "#{contact_column[1]}'s address has been successfully modify."
            end
        end
        Menu.new.option
    end
 
    def find_a_contact
        display_all_contacts
        puts "\nEnter the name you want to find:"
        input = gets.chomp
        fcontact = false

        Contact.all.each do |contact_column|
           
            if input_name == contact_column[1]
                puts "Full Name: #{contact_column[1]}, Phone Number: #{contact_column[2]}, Address: #{contact_column[3]}, Email: #{contact_column[4]}\n"
                Menu.new.show_option
                fcontact = true
            end 
        end
        if !fcontact
            puts "'#{input}' doesn't exist!\n".red
            sleep(2)
            find_a_contact
        end
    end

    def delete_all_contacts
        puts "Do you really want to delete all your contacts?\n".upcase
        input = gets.chomp
        if input =='y' || input =='yes'
            Contact.delete_only_data
            puts "Your contact list is empty!"
            sleep(2)
            system('clear')
            Menu.new.option
        else
            Menu.new.option
        end
    end

    def exit_contacts
        puts "Do you really want to exit? yes or no"
        input = gets.chomp
        if input == "n" || input == "no"
            system('clear')
            Menu.new.option
        else
            system('clear')
            puts "Bye!"
            exit
            Run.new.pause_and_clear_screen
        end 
    end

    def menuback
        puts "\nPress '1' to go back to the menu!\n Or '2' to exit program!"
        input = gets.strip
        if input == "1"
              system ('clear')
            Menu.new.option
        elsif input == "2"
            system('clear')
            exit_contacts
        else
            puts "Wrong input".red
            puts "\nPress '1' to go back to the menu!\n Or '2' to exit program!"
            return menuback
        end
    end
end

 