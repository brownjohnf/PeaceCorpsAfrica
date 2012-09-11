require 'spec_helper'

describe "Revisions" do
  before :each do
    @revision = FactoryGirl.create :revision
  end

  describe "DELETE /revision/1" do
    it "should redirect if not logged in" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      delete revision_path @revision
      response.status.should be(302)
    end
  end

  pending 'revisions request specs'
end
