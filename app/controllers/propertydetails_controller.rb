class PropertydetailsController < ApplicationController
  
  def new 
    @prop=PropertyDetail.new
  end
  
  def create 
    if current_user
      @prop=current_user.property_details.new(params[:property_detail])
    end
    if @prop.save
      flash[:notice] = "New Property has been created successfully"
      redirect_to home_users_path
    else
      flash[:error] = @prop.errors.full_messages.join("<br/>")
    end
  end
  def index
      @prop = PropertyDetail.where(:user_id => current_user.id)
  end
  
  def show
    @prop = PropertyDetail.find(params[:id])
  end
  
  def edit
    @prop = PropertyDetail.find(params[:id])
  end
  def update
    @prop = PropertyDetail.find(params[:id])
    if @prop.update_attributes(params[:property_detail])
      flash[:notice] = "Property details has been updated successfully"
      redirect_to home_users_path
    end
  end
  def destroy
    @prop = PropertyDetail.find(params[:id])
    @prop.destroy
    flash[:notice] = "Record Destroyed"
    redirect_to home_users_path
  end
end
