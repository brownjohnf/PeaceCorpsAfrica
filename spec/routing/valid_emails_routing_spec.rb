require "spec_helper"

describe ValidEmailsController do
  describe "routing" do

    it "routes to #index" do
      get("/valid_emails").should route_to("valid_emails#index")
    end

    it "routes to #new" do
      get("/valid_emails/new").should route_to("valid_emails#new")
    end

    it "routes to #edit" do
      get("/valid_emails/1/edit").should route_to("valid_emails#edit", :id => "1")
    end

    it "routes to #create" do
      post("/valid_emails").should route_to("valid_emails#create")
    end

    it "routes to #update" do
      put("/valid_emails/1").should route_to("valid_emails#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/valid_emails/1").should route_to("valid_emails#destroy", :id => "1")
    end

  end
end
