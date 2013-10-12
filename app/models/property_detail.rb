class PropertyDetail < ActiveRecord::Base

  attr_accessible :address, :area, :city, :country, :price, :property_type, :sold_status, :state, :user_id, :pictures_attributes

  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  
  SOLD_STATUS = {:sold => 'Sold', :not_sold => 'Not Sold'} 
  
  belongs_to :user
  
  has_many :agreements
  
  validates_presence_of :area, :city, :country, :price, :state, :address
  
end
