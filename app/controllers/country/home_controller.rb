class Country::HomeController < ApplicationController
  skip_authorization_check

  def index
    @users = User.all
    @country = Country.find_by_code(params[:country_code].upcase)
  end
end
