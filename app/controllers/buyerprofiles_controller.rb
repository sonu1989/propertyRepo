class BuyerprofilesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @prop=PropertyDetail.where(:city => params[:looking_city],)
  end
  
  def new
    @buyer=BuyerProfile.new
  end
  def create
    @buyer = current_user.buyer_profiles.new(params[:buyer_profile])
    if @buyer.save
      flash[:notice] = "We looking property as yours requirement"
      redirect_to :controller => 'buyerprofiles', :action => 'index', :looking_city =>params[:buyer_profile][:looking_city], :looking_country =>params[:buyer_profile][:looking_country], :min_budget =>params[:buyer_profile][:min_budget], :max_budget =>params[:buyer_profile][:max_budget]
    else
      flash[:error] = @prop.errors.full_messages.join("<br/>")
    end
  end
  def show
   @prop = PropertyDetail.find(params[:id])
  end
end
