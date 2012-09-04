class InitiativesController < ApplicationController
  authorize_resource

  # GET /initiatives
  # GET /initiatives.json
  def index
    @initiatives = Initiative.all
    @countries = Country.all

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
    @initiative = Initiative.find_by_abbreviation(params[:id].upcase)

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  # GET /initiatives/new
  # GET /initiatives/new.json
  def new
    @initiative = Initiative.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @initiative }
    end
  end

  # GET /initiatives/1/edit
  def edit
    @initiative = Initiative.find_by_abbreviation(params[:id].upcase)
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
    @initiative = Initiative.new(params[:initiative])

    respond_to do |format|
      if @initiative.save
        format.html { redirect_to edit_initiative_path(@initiative), notice: 'Initiative was successfully created.' }
        format.json { render json: @initiative, status: :created, location: @initiative }
      else
        format.html { render action: "new" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /initiatives/1
  # PUT /initiatives/1.json
  def update
    @initiative = Initiative.find_by_abbreviation(params[:id].upcase)

    respond_to do |format|
      if @initiative.update_attributes(params[:initiative])
        format.html { redirect_to @initiative, notice: 'Initiative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.json
  def destroy
    @initiative = Initiative.find_by_abbreviation(params[:id].upcase)
    @initiative.destroy

    respond_to do |format|
      format.html { redirect_to initiatives_url }
      format.json { head :no_content }
    end
  end
end
