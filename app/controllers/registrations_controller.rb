class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    #@pictures = @user.pictures.build
  end
   
end
