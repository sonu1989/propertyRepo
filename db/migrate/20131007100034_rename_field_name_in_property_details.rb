class RenameFieldNameInPropertyDetails < ActiveRecord::Migration
  def self.up
    rename_column :property_details, :user_id, :seller_id
  end

  def self.down
    rename_column :property_details, :seller_id, :user_id
  end
end
