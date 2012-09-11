require "spec_helper"

describe RevisionsController do
  describe "routing" do

    it "routes to #index" do
      get("pages/1/revisions").should route_to("revisions#index", :page_id => '1')
    end

    it "routes to #new" do
      get("pages/1/revisions/new").should route_to("revisions#new", :page_id => '1')
    end

    it "routes to #show" do
      get("pages/1/revisions/1").should route_to("revisions#show", :id => "1", :page_id => '1')
    end

    it "routes to #edit" do
      get("pages/1/revisions/1/edit").should route_to("revisions#edit", :id => "1", :page_id => '1')
    end

    it "routes to #create" do
      post("pages/1/revisions").should route_to("revisions#create", :page_id => '1')
    end

    it "routes to #update" do
      put("pages/1/revisions/1").should route_to("revisions#update", :id => "1", :page_id => '1')
    end

    it "routes to #destroy" do
      delete("/revisions/1").should route_to("revisions#destroy", :id => "1")
    end

  end
end
