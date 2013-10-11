class SearchPropertiesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @prop = PropertyDetail.all
    @buyer = BuyerProfile.new
  end
  
  def show
   @prop = PropertyDetail.find(params[:id])
  end
  
end
