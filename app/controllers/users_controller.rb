class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def home
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
end
