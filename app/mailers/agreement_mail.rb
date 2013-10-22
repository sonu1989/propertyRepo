class AgreementMail < ActionMailer::Base
  default from: 'sonu@grepruby.com'
  
  def agreement_email(seller_id,buyer_id,property_detail)
    @seller = User.find(seller_id)
    @buyer = User.find(buyer_id)
    @prop = property_detail
    @agreement = Agreement.where(:buyer_id => buyer_id)
    emails = [User.find(seller_id).email, User.find(buyer_id).email]
    mail({
       :to => emails,
       :subject => "Agreement Mail"
     }).deliver
  end
  
end
