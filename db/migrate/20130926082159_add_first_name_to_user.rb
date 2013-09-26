class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :date
    add_column :users, :mobile, :string
    add_column :users, :user_type, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    
  end
end
