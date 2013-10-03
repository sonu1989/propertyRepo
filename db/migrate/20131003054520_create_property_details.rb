class CreatePropertyDetails < ActiveRecord::Migration
  def change
    create_table :property_details do |t|
      t.integer :user_id
      t.string :property_type
      t.decimal :area
      t.decimal :price
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :sold_status

      t.timestamps
    end
  end
end
