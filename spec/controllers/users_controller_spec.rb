require 'spec_helper'

describe UsersController do

  login_admin

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @admin.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @admin.id
      assigns(:user).should == @admin
    end
    
  end

end
