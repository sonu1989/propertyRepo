class AgreementMail < ActionMailer::Base
  default from: APP_CONFIG["development"]["default_email"]
  default from: APP_CONFIG["production"]["default_email"]
  
  def agreement_mail_to_seller(agreement)
    @seller = User.find(agreement.seller_id)
    @buyer = User.find(agreement.buyer_id)
    @prop = agreement.property_detail
    @agreement = agreement
    mail({
       :to => @seller.email,
       :subject => "Agreement Mail"
     })
  end
  
  def agreement_mail_to_buyer(agreement)
    @buyer = User.find(agreement.buyer_id)
    @seller = User.find(agreement.seller_id)
    @prop = agreement.property_detail
    @agreement = agreement
    mail({
       :to => @buyer.email,
       :subject => "Agreement Mail"
     })
  end
  
end
