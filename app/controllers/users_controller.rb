class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:new, :edit, :show]
  
  def home
   @user = User.all
  end
  
  def show
     @user = User.find(params[:id])
  end
  
  def edit
    @user = User.new
  end
  
end
