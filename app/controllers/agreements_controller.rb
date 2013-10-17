class AgreementsController < ApplicationController
  before_filter :authenticate_user!
  
  def generate_agreement
    @agreement = Agreement.new
    @prop = PropertyDetail.find(params[:property_id])
    @seller = User.find(params[:user_id])
  end
  
  def create
    @agreement = Agreement.new(params[:agreement])
    @seller = User.find(params[:agreement][:seller_id])
    if @agreement.save
      flash[:notice] = "Agreement Created Successfully"
      redirect_to search_properties_path
    else
      flash[:error] = @agreement.errors.full_messages.join("<br/>")
    end
  end
  
end
