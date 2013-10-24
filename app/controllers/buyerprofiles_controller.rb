class BuyerprofilesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  
  def index
  
  end
  
  def show
    @buyer = buyer_profiles_info
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
  
  def edit
    @buyer = buyer_profiles_info
  end
  
  def update
    buyer = buyer_profiles_info
    if buyer.update_attributes(params[:buyer_profile])
      flash[:notice] = "Your property profile updated successfully"
      redirect_to buyerprofiles_path
    end
  end
  
  private
  
  def buyer_profiles_info
    current_user.buyer_profiles.find(params[:id])
  end
end
