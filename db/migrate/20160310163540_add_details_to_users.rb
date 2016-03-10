class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :contact_number, :integer
  	add_column :users, :born_on, :date
  	add_column :users, :gender, :integer
  	add_column :users, :address1, :text
  	add_column :users, :address2, :text
  	add_column :users, :postal_code, :string
  	add_column :users, :country_of_residence, :string
  	add_column :users, :nationality, :string
  	add_column :users, :nationality, :string
  	add_column :users, :emergency_contact_name, :string
  	add_column :users, :emergency_contact_no, :integer
  	add_column :users, :medical_condition, :boolean
  	add_column :users, :singlet_size, :integer
  	add_column :users, :socks_size, :integer
  	add_column :users, :racebibname, :string
  end
end
