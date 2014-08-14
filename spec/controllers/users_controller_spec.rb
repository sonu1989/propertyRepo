require 'rails_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "GET home" do
    it "has a 200 status code" do
      get :home
      expect(response.status).to eq(200)
    end
  end 
end
