class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    (current_user.user_type == User::USER_TYPE[:seller]) ? home_users_path : buyerprofiles_path
  end
end
