module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise_mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.add_role :admin
      sign_in @user
    end
  end
end
