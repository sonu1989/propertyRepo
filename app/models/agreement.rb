class Agreement < ActiveRecord::Base
  attr_accessible :buyer_id, :seller_id, :description, :price, :property_detail_id, :property_status
  
  belongs_to :user
  belongs_to :property_detail
  
  validates_presence_of :buyer_id, :seller_id, :price, :property_detail_id
  
  after_create :agreement_email_to_seller_and_buyer
  
  def agreement_email_to_seller_and_buyer
    AgreementMail.agreement_email(self)
  end
  
end
