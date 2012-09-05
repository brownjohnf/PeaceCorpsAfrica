require "spec_helper"

describe Country::HomeController do
  describe "routing" do
    it "routes to country/home#index" do
      get("/sn").should route_to("country/home#index", :country_code => 'sn')
    end
  end
end
