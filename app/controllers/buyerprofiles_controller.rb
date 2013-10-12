class BuyerprofilesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  
  def index
  end
 
  def create
    @buyer = current_user.buyer_profiles.new(params[:buyer_profile])
    if @buyer.save
      flash[:notice] = "We looking property as yours requirement"
      redirect_to :controller => 'search_properties', :action => 'index', :looking_city =>params[:buyer_profile][:looking_city], :looking_country =>params[:buyer_profile][:looking_country], :min_budget =>params[:buyer_profile][:min_budget], :max_budget =>params[:buyer_profile][:max_budget], :property_type =>params[:buyer_profile][:property_type]
    else
      flash[:error] = @prop.errors.full_messages.join("<br/>")
    end
  end
  
end
