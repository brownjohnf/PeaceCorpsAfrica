class HomeController < ApplicationController
  skip_authorization_check

  def index
    @users = User.all
    @country = Country.find(params[:country_id]) if params[:country_id]
  end
end
