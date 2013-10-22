class RenameUserIdInAgreement < ActiveRecord::Migration
   def change
    rename_column :agreements, :user_id, :buyer_id
  end
end
