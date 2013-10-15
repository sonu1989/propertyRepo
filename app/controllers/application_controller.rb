class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    if current_user.user_type == "Seller"
      home_users_path
    else
      buyerprofiles_path
    end
  end
  
end
