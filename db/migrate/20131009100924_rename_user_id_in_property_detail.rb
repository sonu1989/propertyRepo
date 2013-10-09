class RenameUserIdInPropertyDetail < ActiveRecord::Migration
  
  def change
    rename_column :property_details, :seller_id, :user_id
  end
  def up
  end

  def down
  end
end
