class HomeController < ApplicationController
  skip_authorization_check

  def index
    @users = User.all
  end
end
