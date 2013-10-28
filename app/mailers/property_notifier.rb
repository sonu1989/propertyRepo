class PropertyNotifier < ActionMailer::Base
  default from: APP_CONFIG["development"]["default_email"]
  default from: APP_CONFIG["production"]["default_email"]
  
  def property_notfication_mail(buyer)
    @buyer = buyer.user
    @property_count = PropertyDetail.property_count_by_city_and_budget(buyer.looking_city, buyer.min_budget, buyer.max_budget)
    if @buyer.present?
      mail({
         :to => @buyer.email,
         :subject => "Property Notification as your property profile"
       })
    end
  end
  
end
