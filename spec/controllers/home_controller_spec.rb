require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "assigns all active countries as @countries" do
      country = FactoryGirl.create :active_country
      FactoryGirl.create :inactive_country
      get :index, {}
      assigns(:countries).should eq([country])
    end    
  end

end
