class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def home
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def buyer_home
  
  end
  
  def search_property
    
  end
  
end
