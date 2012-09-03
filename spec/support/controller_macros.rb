module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise_mapping"] = Devise.mappings[:user]
      @user = Factory.create(:user)
      @user.confirm!
      @user.add_role :admin
      sign_in @user
    end
  end
end
