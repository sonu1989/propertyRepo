class BuyerprofilesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def index
  
  end
  
  def new
    @buyer = BuyerProfile.new
  end  
 
  def create
    @buyer = current_user.buyer_profiles.new(params[:buyer_profile])
    if @buyer.save
      flash[:notice] = "Your property profile created successfully"
      redirect_to buyerprofiles_path
    else
      flash[:error] = @buyer.errors.full_messages.join("<br/>")
    end
  end
  
end
