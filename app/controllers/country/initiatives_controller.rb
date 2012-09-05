class Country::InitiativesController < ApplicationController
  authorize_resource

  def index
    @country = Country.find_by_code(params[:country_code].upcase)
    @initiatives = @country.initiatives
    render :text => 'initiatives/index'
  end

  def show
    @country = Country.find_by_code(params[:country_code].upcase)
    @initiative = @country.initiatives.find_by_abbreviation(params[:id].upcase)
    render :text => "#{@country.name} -> #{@initiative.name}"
  end

end
