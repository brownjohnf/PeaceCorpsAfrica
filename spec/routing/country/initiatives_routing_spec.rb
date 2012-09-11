require "spec_helper"

describe Country::InitiativesController do
  describe "routing" do
    it "routes to country/initiatives#index" do
      get("/sn/initiatives").should route_to("country/initiatives#index", :country_code => 'sn')
    end

    it 'routes to country/initiatives#show' do
      get('/sn/initiatives/stomp').should route_to('country/initiatives#show', :country_code => 'sn', :id => 'stomp')
    end
  end
end
