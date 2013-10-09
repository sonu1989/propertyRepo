class CreateBuyerProfiles < ActiveRecord::Migration
  def change
    create_table :buyer_profiles do |t|
      t.integer :user_id
      t.decimal :min_budget
      t.decimal :max_budget
      t.string :property_type
      t.string :looking_country
      t.string :looking_city

      t.timestamps
    end
  end
end
