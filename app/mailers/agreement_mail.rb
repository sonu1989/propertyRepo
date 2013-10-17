class AgreementMail < ActionMailer::Base
  default from: 'sonu@grepruby.com'
  
  def agreement_email(seller_id,user)
    seller = User.find(seller_id)
    emails = [seller.email, user.email]
    mail({
       :to => emails,
       :subject => "Agreement Mail"
     }).deliver
  end
  
end
