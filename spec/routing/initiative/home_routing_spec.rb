require "spec_helper"

describe Initiative::HomeController do
  describe "routing" do
    it "routes to initiative/home#index" do
      get("/stomp").should route_to("initiative/home#index", :abbreviation => 'stomp')
    end
  end
end
