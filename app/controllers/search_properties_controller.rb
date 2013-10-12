class SearchPropertiesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @prop=PropertyDetail.all
    @buyer = BuyerProfile.new
  end
  
  def show
    @prop = PropertyDetail.find(params[:id])
    @seller=User.where(:id => @prop.user_id)
  end
  
  def search_property
    #@prop=PropertyDetail.where(:property_type => params[:property_type],:city => params[:looking_city],:country=> params[:looking_country], :price =>params[:min_budget] .. params[:max_budget])
  end
  
end
