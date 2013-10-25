class NewPropertyRegistrationMail < ActionMailer::Base
  default from: APP_CONFIG["development"]["default_email"]
  default from: APP_CONFIG["production"]["default_email"]
  def new_property_registration_mail(property)
    @property = property
    buyer_profiles = property.user.buyer_profiles
    @buyer = buyer_profiles.where(:looking_city => property.user.city).user if buyer_profiles.present?
    if @buyer.present?
      mail({
         :to => @buyer.email,
         :subject => "New Property Registered"
       }).deliver
    end
  end
  
end
