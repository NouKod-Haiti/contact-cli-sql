class Main
    attr_accessor :name, :phone_number, :address, :email
  
    def initialize(name, phone_number, address, email)
      @name = name
      @phone_number = phone_number
      @address = address
      @email = email
    end
  
    def to_s
      "\nName: #{@name}\nPhone Number: #{@phone_number}\nAddress: #{@address}\nEmail: #{@email}"
    end
  end