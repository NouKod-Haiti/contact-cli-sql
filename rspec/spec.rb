# require "spec_helper"

require_relative '../config/environment.rb'



describe Contact do



let(:donveve) {Contact.new("veniel", 38139054, "port-au-prince, Bonamy street", "vdorestave@gmail.com")}



before(:each) do |trial|

unless trial.metadata[:skip_before]



DB[:conn].execute("DROP TABLE IF EXISTS contacts")

sql = <<-SQL

CREATE TABLE IF NOT EXISTS contacts (

id INTEGER PRIMARY KEY,

name TEXT,

phone INTEGER,

address STRING,

email STRING 

)

SQL

DB[:conn].execute(sql)

end

end



describe "attributes" do

it 'has a name, a phone, an address,  an email' do

contact = Contact.new("Therese", 3045678, "port-au-prince, fleuriot", "therese12@gmail.com")

expect(contact.name).to eq("Therese")

expect(contact.phone).to eq(3045678)

expect(contact.address).to eq("port-au-prince, fleuriot")

expect(contact.email).to eq("therese12@gmail.com")

end

end



it 'has an id that defaults to `nil` on initialization' do

contact = Contact.new("Therese", 3045678, "port-au-prince, fleuriot", "therese12@gmail.com")

expect(contact.id).to eq(nil)

end



describe ".create_table" do

it 'creates the contacts table in the database', :skip_before do

DB[:conn].execute("DROP TABLE IF EXISTS contacts")

Contact.create_table

table = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='contacts';"

expect(DB[:conn].execute(table)[0]).to eq(['contacts'])

end

end



describe ".drop_table" do

it 'drops the contacts table from the database' do

Contact.drop_table

table = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='contacts';"

expect(DB[:conn].execute(table)[0]).to eq(nil)

end

end



describe "#save" do

it 'saves an instance of the Contact class to the database and then sets the given contacts `id` attribute' do

ja = Contact.new("Jaco", 48563638, "Delams 33", "jaco00@yahoo.fr")

ja.save

expect(DB[:conn].execute("SELECT * FROM contacts")).to eq([[1, "Jaco", 48563638, "Delams 33", "jaco00@yahoo.fr"]])

expect(ja.id).to eq(1)

end



it 'updates a record if called on an object that is already persisted' do

wiwi = Contact.new("Wilciane", 3450956, "delmas 32", "wilciane@gmail.com")

wiwi.save

wiwi_id = wiwi.id

wiwi.name = "Wilciane"

wiwi.save

wiwi_db = DB[:conn].execute("SELECT * FROM contacts WHERE id = ?", wiwi_id)

expect(wiwi_db[0][1]).to eq("Wilciane")

end

end




describe ".create_table" do
    it 'creates the contacts table in the database' do
      DB[:conn].execute("DROP TABLE IF EXISTS contacts")
      Contact.create_table
      table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='contacts';"
      expect(DB[:conn].execute(table_check_sql)[0]).to eq(['contacts'])
    end
  end



# describe '.new_from_db' do

#     it 'creates an instance with corresponding attribute values' do

#     db = [1, "ti paste", 5094567890, "granbwa 56", "tipa@yahoo.fr"]

#     line = Contact.new_from_db(db)



#         expect(db.id).to eq(line[0])

#         expect(db.name).to eq(line[1])

#         expect(db.phone).to eq(line[2])

#         expect(db.address).to eq(line[3])

#         expect(db.email).to eq(line[4])

#     end

# end


  describe '.delete_only_data' do
    it ' deletes  one data in the database' do
      Contact.delete_only_data
      table = "SELECT * FROM contacts"
      expect(DB[:conn].execute(table)[0]).to eq(nil)
    end 
  end 

  describe 'update' do
    it 'updates the record associated with a given instance' do
      donveve.save
      donveve.name = "Simon"
      donveve.update
      contact_db = Contact.find_by_name("Simon")
      expect(contact_db.id).to eq(donveve.id)
    end

  end

end
