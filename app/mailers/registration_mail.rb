class RegistrationMail < ActionMailer::Base
  default from: 'sonu@grepruby.com'
  
  def registration_mail(user)
    @current_user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @current_user.email, subject: 'Registration Notification')
  end
  
end
