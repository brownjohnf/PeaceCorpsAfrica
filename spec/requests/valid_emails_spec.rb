require 'spec_helper'

describe "ValidEmails" do
  describe "GET /valid_emails" do
    it "should redirect if not logged in" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get valid_emails_path
      response.status.should be(302)
    end
  end
end
