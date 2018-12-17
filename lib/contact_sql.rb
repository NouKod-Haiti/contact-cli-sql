require_relative "../config/environment.rb"

class ContactSql 
    #First create the Class and attibutes
      
      attr_accessor :first_name, :last_name, :person_address, :email, :phone
      attr_reader :id
    #initialize the class
      def initialize(first_name, last_name, person_address, email, phone, id=nil)
        # Text shows including id in the initialize
        @id = id
        @first_name = first_name
        @last_name = last_name
        @address = person_address
        @email = email
        @phone = phone
      end
    #create the data table in SQL
    #   def self.create_table
    #     sql = <<-SQL
    #       CREATE TABLE IF NOT EXISTS contacts (
    #         id INTEGER PRIMARY KEY,
    #         first_name TEXT,
    #         last_name TEXT,
    #         person_address Text,
    #         email Text,
    #         phone Integer
    #       )
    #     SQL
    #   DB[:conn].execute(sql)
    #   end
    # #drop table in SQL
    def self.drop_table
      sql =<<-SQL
        DROP TABLE IF EXISTS contacts
        SQL
      DB[:conn].execute(sql)
    end
    
    #save table and create a new row
    def save
      sql = <<-SQL
        INSERT INTO contacts (first_name, last_name, person_address, email, phone)
        VALUES (?, ?)
        SQL
      DB[:conn].execute(sql, self.first_name, self.last_name, self.person_address, self.email, self.phone)
    
      @id = DB[:conn].execute("SELECT last_insert_row id() FROM contacts")[0][0]
    
    
    end
    
    def self.create(first_name:, last_name:, person_address:, email:, phone:)
      contact = CreateContact.new(first_name, last_name, person_address, email, phone)
      contact.save
      contact
    end
    
    
    def update
        sql = "UPDATE contacts SET first_name = ?, last_name = ?, person_address =?, email = ?, phone = ? WHERE id = ?"
        DB[:conn].execute(sql, self.first_name, self.last_name, self.person_address, self.email, self.phone)
      end
      
    
    
end 

# ve = ContactSql.new("m","k","l","o","u")
# ve.save