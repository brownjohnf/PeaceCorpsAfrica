require "spec_helper"


describe RevisionsController do
  describe "routing" do

    it "routes to #index" do
      get("pages/1/revisions").should route_to("revisions#index", :page_id => '1')
    end

    it "routes to #show" do
      get("pages/1/revisions/1").should route_to("revisions#show", :id => "1", :page_id => '1')
    end

    it "routes to #destroy" do
      delete("/revisions/1").should route_to("revisions#destroy", :id => "1")
    end

  end
end
