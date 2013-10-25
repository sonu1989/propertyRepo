module ApplicationHelper

  def user_profile_image
    ( current_user.pictures.present?) ? current_user.pictures.first.image : User::DEFAULT_USER_IMAGE
  end
  
  def property_image(prop)
    ( prop.pictures.present?) ? prop.pictures.first.image : PropertyDetail::DEFAULT_PROPERTY_IMAGE
  end
end
