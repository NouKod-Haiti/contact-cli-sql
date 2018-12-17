require_relative "create_contact.rb"
class AddressBook < Contact
        def call
            run
            option
            goodbye
       end
        
        def run
            puts "1- Add new contact"
            puts "2- Display all contacts"
            puts "3- Modify contact"
            puts "4- Delete contact"
            puts "5- Exit the program"
            puts ""
        end
    
        def option
            puts "Choose one option\n\n"
            input = gets.chomp.downcase
            case input
            when '1'
            add_contact
            when '2'
            # unless input == 2
            display_contact
            when '3'
            modify_contact
            when '4'
            delete_contact
            when '5'
            exit_contact
            end

        end
            def exit_contact
                puts "would you like to keep working?(yes/no)"
                store = gets.strip
                if store == "yes"
                run
                else
                goodbye
                exit
                end
           end 

           def goodbye
            puts "see you next"
           end

end

input = AddressBook.new
input.call