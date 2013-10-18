class AgreementMail < ActionMailer::Base
  default from: 'sonu@grepruby.com'
  
  def agreement_email(seller_id,user,property_detail)
    @seller = User.find(seller_id)
    @user = user
    @prop = property_detail
    @agreement = Agreement.find(@user.id) 
    emails = [@seller.email, @user.email]
    mail({
       :to => emails,
       :subject => "Agreement Mail"
     }).deliver
  end
  
end
