require "rails_helper"

describe WelcomesController do
  describe "GET welcome" do
    it "has a 200 status code" do
      get :welcome
      expect(response.status).to eq(200)
    end
  end
  describe "GET user_type" do
    it "has a 200 status code" do
      get :user_type
      expect(response.status).to eq(200)
    end
  end
end
