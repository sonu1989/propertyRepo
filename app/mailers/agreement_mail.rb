class AgreementMail < ActionMailer::Base
  default from: 'sonu@grepruby.com'
  
  def agreement_email_seller(seller)
    @seller = seller
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @seller.last.email, subject: 'Agreement Mail')
  end
  def agreement_email_buyer(buyer)
    @current_user = buyer
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @current_user.email, subject: 'Agreement Mail')
  end
  
end
