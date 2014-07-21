class SearchPropertiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @prop = PropertyDetail.all
    @buyer = BuyerProfile.new
  end

  def show
    @prop = PropertyDetail.find(params[:id])
    @seller = User.find(@prop.user_id)
   end

  def search_property
    prop = PropertyDetail.property_by_city_and_budget(params[:looking_city], params[:min_budget], params[:max_budget])
    render :partial => 'search_property', locals: {prop: prop} ,:layout => false
  end

  def search_property_by_city
		result = PropertyDetail.property_by_city(params[:city])
		render :json=> result
  end

end
