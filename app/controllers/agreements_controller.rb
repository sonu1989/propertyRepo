class AgreementsController < ApplicationController
  
  def do_agreement
    @prop = PropertyDetail.where(:id => params[:property_id])
    @seller = User.where(:id => params[:user_id])
  end
end
