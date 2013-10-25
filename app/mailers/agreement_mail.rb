class AgreementMail < ActionMailer::Base
  default from: APP_CONFIG["development"]["default_email"]
  default from: APP_CONFIG["production"]["default_email"]
  def agreement_email(agreement)
    @seller = User.find(agreement.seller_id)
    @buyer = User.find(agreement.buyer_id)
    @prop = agreement.property_detail
    @agreement = agreement
    emails = [@seller.email, @buyer.email]
    mail({
       :to => emails,
       :subject => "Agreement Mail"
     }).deliver
  end
  
end
