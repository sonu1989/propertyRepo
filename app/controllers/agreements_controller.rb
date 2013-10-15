class AgreementsController < ApplicationController
  before_filter :authenticate_user!
  def do_agreement
    @agreement=Agreement.new
    @prop = PropertyDetail.where(:id => params[:property_id])
    @seller = User.where(:id => params[:user_id])
  end
  
  def create
    @agreement = Agreement.new(params[:agreement])
    @seller = User.all
    if @agreement.save
      AgreementMail.agreement_email_buyer(current_user).deliver
      AgreementMail.agreement_email_seller(@seller).deliver
      flash[:notice] = "Agreement Created Successfully"
      redirect_to search_properties_path
    else
      flash[:error] = @agreement.errors.full_messages.join("<br/>")
    end
  end
  
end
