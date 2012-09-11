require "spec_helper"

describe Initiative::CountriesController do
  describe "routing" do
    it "routes to initiative/countries#index" do
      get("/stomp/countries").should route_to("initiative/countries#index", :abbreviation => 'stomp')
    end

    it 'routes to initiative/countries#show' do
      get('/stomp/countries/sn').should route_to('initiative/countries#show', :abbreviation => 'stomp', :id => 'sn')
    end
  end
end
