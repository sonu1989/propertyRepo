class Agreement < ActiveRecord::Base
  attr_accessible :user_id, :seller_id, :description, :price, :property_detail_id, :property_status
  
  belongs_to :user
  belongs_to :property_detail
  
  validates_presence_of :user_id, :seller_id, :price, :property_detail_id
  
  after_create :agreement_email_to_seller_and_buyer
  
  def agreement_email_to_seller_and_buyer
    AgreementMail.agreement_email(self.seller_id,user,property_detail)
  end
  
end
