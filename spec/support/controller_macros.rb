module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise_mapping"] = Devise.mappings[:user]
      @admin = FactoryGirl.create(:user)
      @admin.add_role :admin
      sign_in @admin
    end
  end
end
