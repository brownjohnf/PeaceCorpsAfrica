class Initiative::CountriesController < ApplicationController
  authorize_resource

  def index
    @initiative = Initiative.find_by_abbreviation(params[:abbreviation].upcase)
    @countries = @initiative.countries
    render :text => 'countries/index'
  end

  def show
    @initiative = Initiative.find_by_abbreviation(params[:abbreviation].upcase)
    @country = Country.find_by_code(params[:id].upcase)
    render :text => "#{@initiative.name} -> #{@country.name}"
  end

end
