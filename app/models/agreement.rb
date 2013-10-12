class Agreement < ActiveRecord::Base
  attr_accessible :user_id, :description, :price, :property_detail_id, :property_status
  
  belongs_to :user
  belongs_to :property_detail
  
end
