class BuyerProfile < ActiveRecord::Base
  attr_accessible :user_id, :looking_city, :looking_country, :max_budget, :min_budget, :property_type
  
  belongs_to :user
  
  validates_presence_of :looking_city, :max_budget, :min_budget
  
  after_create :property_notfication
  
  def property_notfication
    PropertyNotifier.property_notfication_mail(self).deliver
  end
  
end
