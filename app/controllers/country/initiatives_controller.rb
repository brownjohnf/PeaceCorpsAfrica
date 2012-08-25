class Country::InitiativesController < ApplicationController
  load_and_authorize_resource

  def index
    @country = Country.find_by_code(params[:country_code].upcase)
    @initiatives = @country.initiatives
    render 'initiatives/index'
  end

end
