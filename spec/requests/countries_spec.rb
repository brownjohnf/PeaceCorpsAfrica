require 'spec_helper'

describe "Countries" do
  describe "GET /countries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get countries_path
      response.status.should be(200)
    end
  end

  describe 'GET /countries/new' do
    it 'should redirect when not logged in' do
      get new_country_path
      response.status.should be 302
    end
  end
end
