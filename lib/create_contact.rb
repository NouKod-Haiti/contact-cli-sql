
class Contact 
    attr_accessor :first_name, :last_name, :person_address, :email, :phone
    
    @@contact_list = [] 
    def initialize  
        @contact={}
    end

    def add_contact( modify_contact = false)
        puts "Enter first name "
        @contact["first"] = gets.chomp

        puts "Enter last name "
        @contact["last"] = gets.chomp

        puts "Enter your email "
        @contact["email"] = gets.chomp

        puts "Enter your phone"
        @contact["phone"] = gets.chomp
        
        puts "Enter your address"
        @contact["address"] = gets.chomp

        if modify_contact == true
            puts "Insert the contact line you want to modify:"
            return @contact
        end 
        @@contact_list << @contact
        run
        option
    end

    def  display_contact
        # puts""
        @@contact_list.each_with_index do |contact, index|
        puts ""  
        puts "#{index+1}-First name:  #{contact["first"]}  |Last name: #{contact["last"]}  |email: #{contact["email"]}  |Phone number: #{contact["phone"]} |Address: #{contact["address"]}"
        puts "******************************************************************************"
        puts ""

    end
        run
        option
    end

    def index (input_value)
    input_value.to_i - 1
    end

    def modify_contact
    # display_contact(contact_list)
    puts "choose  the line you want to modify"
    input2 = gets.strip
    replace = index(input2)
    @@contact_list[replace] = add_contact( true)
    run
    option
    end

    def delete_contact
    puts "What contact would you like to delete"
    input1 = gets.strip
    position = index(input1)
    @@contact_list.delete_at(position)
    run
    option
    end

    def save
        sql = <<-SQL
         INSERT INTO contacts(first_name,last_name,person_address,email,phone) VALUES(?,?,?,?,?)
        SQL
        DB[:conn].execute(sql,self.first_name, self.last_name,self.person_address,self.email,self.phone)
    end



end