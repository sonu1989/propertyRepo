class PropertyDetail < ActiveRecord::Base

  attr_accessible :address, :area, :city, :country, :price, :property_type, :sold_status, :state, :user_id, :pictures_attributes
  
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  
  belongs_to :user
end
