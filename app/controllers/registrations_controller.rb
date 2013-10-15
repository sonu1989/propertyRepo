class RegistrationsController < Devise::RegistrationsController

  def create
   debugger
    RegistrationMail.registration_mail(current_user).deliver
  end


end 
