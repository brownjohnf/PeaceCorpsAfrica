class ValidEmailsController < ApplicationController
  load_and_authorize_resource

  # GET /valid_emails
  # GET /valid_emails.json
  def index
    @valid_emails = ValidEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @valid_emails }
    end
  end

  # GET /valid_emails/1
  # GET /valid_emails/1.json
  def show
    @valid_email = ValidEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @valid_email }
    end
  end

  # GET /valid_emails/new
  # GET /valid_emails/new.json
  def new
    @valid_email = ValidEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @valid_email }
    end
  end

  # GET /valid_emails/1/edit
  def edit
    @valid_email = ValidEmail.find(params[:id])
  end

  # POST /valid_emails
  # POST /valid_emails.json
  def create
    @valid_email = ValidEmail.new(params[:valid_email])

    respond_to do |format|
      if @valid_email.save
        format.html { redirect_to valid_emails_path, notice: 'Valid email was successfully created.' }
        format.json { render json: @valid_email, status: :created, location: @valid_email }
      else
        format.html { render action: "new" }
        format.json { render json: @valid_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /valid_emails/1
  # PUT /valid_emails/1.json
  def update
    @valid_email = ValidEmail.find(params[:id])

    respond_to do |format|
      if @valid_email.update_attributes(params[:valid_email])
        format.html { redirect_to valid_emails_path, notice: 'Valid email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @valid_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valid_emails/1
  # DELETE /valid_emails/1.json
  def destroy
    @valid_email = ValidEmail.find(params[:id])
    @valid_email.destroy

    respond_to do |format|
      format.html { redirect_to valid_emails_url }
      format.json { head :no_content }
    end
  end
end
