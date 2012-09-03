module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise_mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.add_role :admin
      sign_in @user
      puts @user.has_role? :admin
    end
  end
end
