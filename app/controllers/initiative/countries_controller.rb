class Initiative::CountriesController < ApplicationController
  load_and_authorize_resource

  def index
    @initiative = Initiative.find_by_abbreviation(params[:abbreviation].upcase)
    @countries = @initiative.countries
    render 'countries/index'
  end

end

