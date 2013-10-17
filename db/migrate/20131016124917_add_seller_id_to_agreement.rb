class AddSellerIdToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :seller_id, :integer
  end
end
