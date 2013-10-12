class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.integer :property_detail_id
      t.integer :user_id
      t.string :property_status
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
