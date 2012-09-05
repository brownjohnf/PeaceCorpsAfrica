class Initiative::HomeController < ApplicationController
  skip_authorization_check

  def index
    @users = User.all
    @initiative = Initiative.find_by_abbreviation(params[:abbreviation].upcase)
  end
end
