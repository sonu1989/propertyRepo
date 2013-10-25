class PropertyDetail < ActiveRecord::Base
  
  DEFAULT_PROPERTY_IMAGE = "/assets/default_property_image.png"
  PER_PAGE_SIZE = 5
  
  
  attr_accessible :address, :area, :city, :country, :price, :property_type, :sold_status, :state, :user_id, :pictures_attributes
  
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
  belongs_to :user
  has_many :agreements
  
  validates_presence_of :area, :city, :country, :price, :state, :address
  
  SOLD_STATUS = {:sold => 'Sold', :not_sold => 'Not Sold'} 
  
  PROPERTY_TYPE = {'residential' => 'Residential', 'commercial' => "Commercial"}
    
  scope :property_by_city_and_budget, lambda {|city, min_budget, max_budget| where(:city => city, :price => min_budget.to_i .. max_budget.to_i)}
  
  after_create :new_property_registration_mail_to_buyer
  
  def new_property_registration_mail_to_buyer
    NewPropertyRegistrationMail.new_property_registration_mail(self)
  end
  
end
