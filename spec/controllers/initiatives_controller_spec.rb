require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InitiativesController do

  # This should return the minimal set of attributes required to create a valid
  # Initiative. As you add validations to Initiative, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InitiativesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all initiatives as @initiatives" do
      initiative = Initiative.create! valid_attributes
      get :index, {}, valid_session
      assigns(:initiatives).should eq([initiative])
    end
  end

  describe "GET show" do
    it "assigns the requested initiative as @initiative" do
      initiative = Initiative.create! valid_attributes
      get :show, {:id => initiative.to_param}, valid_session
      assigns(:initiative).should eq(initiative)
    end
  end

  describe "GET new" do
    it "assigns a new initiative as @initiative" do
      get :new, {}, valid_session
      assigns(:initiative).should be_a_new(Initiative)
    end
  end

  describe "GET edit" do
    it "assigns the requested initiative as @initiative" do
      initiative = Initiative.create! valid_attributes
      get :edit, {:id => initiative.to_param}, valid_session
      assigns(:initiative).should eq(initiative)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Initiative" do
        expect {
          post :create, {:initiative => valid_attributes}, valid_session
        }.to change(Initiative, :count).by(1)
      end

      it "assigns a newly created initiative as @initiative" do
        post :create, {:initiative => valid_attributes}, valid_session
        assigns(:initiative).should be_a(Initiative)
        assigns(:initiative).should be_persisted
      end

      it "redirects to the created initiative" do
        post :create, {:initiative => valid_attributes}, valid_session
        response.should redirect_to(Initiative.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved initiative as @initiative" do
        # Trigger the behavior that occurs when invalid params are submitted
        Initiative.any_instance.stub(:save).and_return(false)
        post :create, {:initiative => {}}, valid_session
        assigns(:initiative).should be_a_new(Initiative)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Initiative.any_instance.stub(:save).and_return(false)
        post :create, {:initiative => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested initiative" do
        initiative = Initiative.create! valid_attributes
        # Assuming there are no other initiatives in the database, this
        # specifies that the Initiative created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Initiative.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => initiative.to_param, :initiative => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested initiative as @initiative" do
        initiative = Initiative.create! valid_attributes
        put :update, {:id => initiative.to_param, :initiative => valid_attributes}, valid_session
        assigns(:initiative).should eq(initiative)
      end

      it "redirects to the initiative" do
        initiative = Initiative.create! valid_attributes
        put :update, {:id => initiative.to_param, :initiative => valid_attributes}, valid_session
        response.should redirect_to(initiative)
      end
    end

    describe "with invalid params" do
      it "assigns the initiative as @initiative" do
        initiative = Initiative.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Initiative.any_instance.stub(:save).and_return(false)
        put :update, {:id => initiative.to_param, :initiative => {}}, valid_session
        assigns(:initiative).should eq(initiative)
      end

      it "re-renders the 'edit' template" do
        initiative = Initiative.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Initiative.any_instance.stub(:save).and_return(false)
        put :update, {:id => initiative.to_param, :initiative => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested initiative" do
      initiative = Initiative.create! valid_attributes
      expect {
        delete :destroy, {:id => initiative.to_param}, valid_session
      }.to change(Initiative, :count).by(-1)
    end

    it "redirects to the initiatives list" do
      initiative = Initiative.create! valid_attributes
      delete :destroy, {:id => initiative.to_param}, valid_session
      response.should redirect_to(initiatives_url)
    end
  end

end
