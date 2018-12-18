
class Menu
    def option
        puts "Choose an option?"
        puts" "
        puts"\n1: Add a new contact"
        puts"\n2: Display contacts"
        puts"\n3: Modification Option"
        puts"\n4: Exit"
        puts"\n5: Delete an options"
        puts"\n6: Search A Contact"
        puts"\e: To Exit The Program"
        end
        option = gets.chomp.to_s
        case option
        when "1"
            Controller.new.add_contact
            system('clear')
            option
        when "2"
            Controller.new.display_all_contacts
            puts "Your contact list is empty." if Contact.all.empty?
            sleep(1) 
            Controller.new.menuback
            option 
           
        when "3"
            clear_contact
            
            Run.new.modify_options
            
        when "4"
            clear_contact
            
            Controller.new.exit
                
        when "5"
            clear_contact
            Runs.new.delete_options
        
        when '6'
            clear_contact
            Controller.new.find_a_contact
                
        when 'e'
            Controller.new.exit_contacts
        else 
            option
        end   
    end

    def clear_contact
        if Contact.all.empty?
            system ('clear')
            puts "Your contact list is empty." 
            sleep(1)
            Controller.new.menuback
            option
        end
    end
end



