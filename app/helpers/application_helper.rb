module ApplicationHelper

  def user_profile_image
    ( user_signed_in? || ( !current_user.pictures.blank? && !current_user.pictures.first.image.blank?) ) ? current_user.pictures.first.image : User::DEFAULT_USER_IMAGE
  end
  
end
