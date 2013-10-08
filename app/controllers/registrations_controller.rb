class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end
  def create
  debugger
     RegistrationMailer.welcome_email(@user).deliver
  end
 end
