class NewPropertyRegistrationMail < ActionMailer::Base
  default from: 'sonu@grepruby.com'
  
  def new_property_registration_email(property)
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
