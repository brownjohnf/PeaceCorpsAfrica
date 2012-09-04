class HomeController < ApplicationController
  skip_authorization_check

  def index
    @countries = Country.active.all
  end

end
