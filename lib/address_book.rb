require 'csv'  
require_relative "contact"


class AddressBook
  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def add_contact(name, phone, address, email)
    @contacts << Contact.new(name, phone, address, email)
  end

  def binary_search(name)
    lower = 0
    upper = contacts.length - 1

    while upper >= lower
      mid = (upper + lower) / 2
      mid_value = contacts[mid].name
      val = name <=> mid_value

      if val < 0
        lower = mid + 1
      elsif val > 0
        upper = mid - 1
      else
        return contacts[mid]
      end
    end

    return nil
  end

  def search(name)
    # Maybe we have more than one implementation of search? 
    return binary_search(name)
  end

  def add_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true)
    new_contacts = csv.count
    csv.each do |row|
      row_hash = row.to_hash
      @contacts << Contact.new(row_hash["name"], row_hash["phone_number"], row_hash["address"], row_hash["email"])
    end

    system "clear"
    puts "#{new_contacts} new contacts added from #{file_name}"
  end
end
