class Address

def call
  run
  option
 end

 def run
    
         puts "1- Add new contact"
         puts "2- Display all contacts"
         puts "3- Modify contact"
         puts "4- Delete contact"
         puts "5- Find a contact"
         puts "6- Exit the program"
         puts ""
 end
 
 def option
  puts "Choose one option\n\n"
  input = gets.chomp.downcase
  case input
  when '1'
  add_contact
  run
  option
  when '2'     
  display_contact
  run
  option
  when '3'
  modify_contact
  run
  option
  when '4'
  delete_contact
  run
  option
  when '5'
  find_a_contact
  run
  option
  when '6'
  exit_contact
  end

 end

        
def add_contact

        puts "Enter Fullname:"
        name = gets.chomp
        
        puts "Enter Address:"
        address = gets.chomp
        

        puts "Enter E-mail:"
        email = gets.chomp
        until email.end_with?(".com") && email.include?("@") || email.end_with?(".fr") && email.include?("@") || email.end_with?(".ht") && email.include?("@")
            puts "Enter a correct Email"
            email = gets.chomp
        end
    
       
        puts "Enter Phone Number:"
        phone = gets.chomp
        until !phone.empty? && (phone[/\d{11}/])
            puts "Enter a correct Phone Number"
            phone = gets.chomp
        end
            
        
         Contact.create(name: name, phone: phone, address: address, email: email)       #@address
       puts "your contact is created with success!"
       puts "-------------------------------------"
    end 
    
    end

def display_contact	   
        
    puts "----------------------------------------------------------------------" 
    puts "|ID |   FULL NAME    |   PHONE NUMBER    |   ADDRESS   |   EMAIL     |"
    puts "----------------------------------------------------------------------"
    puts "    "

    # table = Terminal::Table.new do |t|
    #     t << ['One', 1]
    #     t << :separator
    #     t.add_row ["Two\nDouble", 2]
    #     t.add_separator
    #     t.add_row ['Three', 3]
    #   end
      
      # > puts table
    
 Contact.all.each do |row|
      puts "| #{row.join " | " } |"
    # row.join
    #     end	   
    #     Terminal::Table.new :title => "Contact list", :headings => ['Full name', 'Address', 'Phone', 'Email'], :rows => table
        
     puts ""
end 	   
end
 	      
def delete_contact 
        
        puts "\n Enter the id contact you want to delete!"
        input = gets.chomp.to_i
        id_found = false
        
        Contact.all.each do |contact|    
            if contact[0] == input
                Contact.drop_row input
                id_found = true
            end
            puts "Contact id #{input} has been deleted!\n"
            
        end

        until id_found == true
            puts "'#{input}' is not in your contact!\n"
           return delete_contact
           puts "---------------------------------"
         end
        
    end
 
    
    def modify_contact
        
        puts "Enter the contact id you want to modify!"
        id =  gets.to_i
        id_exist = false

        Contact.all.each do |column|
            if id == column.first
                
                puts "Enter A New Name"
                name = gets.chomp.capitalize
                until !name.empty? 
                    name = gets.chomp
                end
                
                puts "Enter A new Email"
                email = gets.chomp.downcase
                until email.end_with?(".com") && email.include?("@") || email.end_with?(".fr") && email.include?("@") || email.end_with?(".ht") && email.include?("@")
                    puts "Enter a corect Email"
                    email = gets.chomp
                end
               
                puts "Enter A New Phone Number"
                phone = gets.chomp
                until !phone.empty? && (phone[/\d{11}/])
                    puts "Enter A corect Phone Number"
                    phone = gets.chomp
                end
        
                
                puts "Enter A New Address"
                address = gets.chomp.capitalize
                until !address.empty? 
                    address = gets.chomp
                end
                
                input = Contact.new column.first, name, phone, address, email
                input.update
                puts "Contact id #{id} has been modified!\nBelow is your modified contact:1"
                puts "\nYour new contact is:\n\Full Name: " +"#{input.name}" + ", Phone: " + "#{input.phone}" + ", Address: " + "#{input.address}" + ", Email: " +"#{input.email}"
                id_exist = true
            end
        end
        until id_exist == true
           puts "'#{id}' is not in your contact!\n"
           modify_contact
           puts "-------------------------------------"
        end
        
    end

    
    def find_a_contact
        puts "\nEnter the name you want to look for:"
        input_name = gets.chomp
        is_found = false

        Contact.all.each do |contact_column|
            if input_name == contact_column[1]
                puts "Full Name: " + "#{contact_column[1]}" + ", Phone Number: " + "#{contact_column[2]}" + ", Address: " + "#{contact_column[3]}"+ ", Email: " + "#{contact_column[4]}\n\n"
                is_found = true
            end 
        end
        if !is_found
            puts "'#{input_name}' is not in your contact list!\n"
            puts "---------------------------------"
            run
            option
            find_a_contact
            puts "----------------------------------"
        end
    end

    

    
    
        def delete_all_data_from_table	   
        
                puts "Are you sure to delete all data from database?\n"	   
                
                puts "Enter 'yes' or 'no'."	   
                
                input = gets.chomp	   
                
                if input =='y' || input =='yes' || input == 'YES'	   
                
                 Contact.delete_only_data	   
                
                 puts "Your contacts has been emptied from the database!"	
                 puts "-----------------------------------"   
                
                end	   
        
        end	   
    
        def exit_contact
    
                puts "Are you sure you want to exit? (yes/no)"
                input = gets.chomp
                if input == "n" || input == "N"
                call
                else
             puts "Good Bye"
             exit(0)
             call
                end
        end

     
    

    	   
    
    
