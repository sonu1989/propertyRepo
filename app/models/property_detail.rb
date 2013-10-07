class PropertyDetail < ActiveRecord::Base

  attr_accessible :address, :area, :city, :country, :price, :property_type, :sold_status, :state, :user_id, :pictures_attributes
  validates_presence_of :area
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :price
  validates_presence_of :state
  validates_presence_of :address
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  
  belongs_to :user
end
