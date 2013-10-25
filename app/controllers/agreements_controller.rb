class AgreementsController < ApplicationController
  before_filter :authenticate_user!
  
  def generate_agreement
    @agreement = Agreement.new
    @prop = PropertyDetail.find(params[:property_id])
    @seller = get_user(params[:seller_id])
  end
  
  def create
    @agreement = Agreement.new(params[:agreement])
    @seller = get_user(params[:agreement][:seller_id])
    if @agreement.save
      flash[:notice] = "Agreement Created Successfully"
      redirect_to search_properties_path
    else
      flash[:error] = @agreement.errors.full_messages.join("<br/>")
    end
  end
  
  private 
  
  def get_user(id)
    User.find(id)
  end
end
