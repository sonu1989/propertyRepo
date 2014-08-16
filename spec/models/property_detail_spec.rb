require 'rails_helper'

describe PropertyDetail do
  it 'has one after add one' do
    PropertyDetail.create(:area=>2000, :city=>"Test", :country=>"Test", :price=>10000, :state=>"Test", :address=>"Test")
    expect(PropertyDetail.count).to eq 1
  end
  it 'has a list of property with respect to budget and city' do
    PropertyDetail.create(:area=>2000, :city=>"Test", :country=>"Test", :price=>10000, :state=>"Test", :address=>"Test")
    list = PropertyDetail.property_count_by_city_and_budget('Test',5000,10000)
  end
end
