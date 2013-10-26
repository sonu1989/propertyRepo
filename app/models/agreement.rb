class Agreement < ActiveRecord::Base
  attr_accessible :buyer_id, :seller_id, :description, :price, :property_detail_id, :property_status
  
  belongs_to :user
  belongs_to :property_detail
  
  validates_presence_of :buyer_id, :seller_id, :price, :property_detail_id
  
  after_create :agreement_email_to_seller
  
  after_create :agreement_email_to_buyer
  
  def agreement_email_to_seller
    AgreementMail.agreement_mail_to_seller(self).deliver
  end
  
  def agreement_email_to_buyer
    AgreementMail.agreement_mail_to_buyer(self).deliver
  end
end
