class PropertydetailsController < ApplicationController
  before_filter :authenticate_user!
  
  def new 
    @prop = PropertyDetail.new
  end
  
  def create 
    @prop = current_user.property_details.new(params[:property_detail])
    if @prop.save
      flash[:notice] = "New Property has been created successfully"
      redirect_to home_users_path
    else
      flash[:error] = @prop.errors.full_messages.join("<br/>")
    end
  end
  
  def index
    @prop = current_user.property_details.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
    @prop = current_user.property_details.find(params[:id])
  end
  
  def edit
    @prop = current_user.property_details.find(params[:id])
  end
  
  def update
    prop = current_user.property_details.find(params[:id])
    if prop.update_attributes(params[:property_detail])
      flash[:notice] = "Property details has been updated successfully"
      redirect_to home_users_path
    end
  end
  
  def destroy
    prop = current_user.property_details.find(params[:id])
    sprop.destroy
    flash[:notice] = "Record Destroyed"
    redirect_to home_users_path
  end
end
