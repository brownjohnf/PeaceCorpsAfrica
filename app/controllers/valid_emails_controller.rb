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
    @valid_email = ValidEmail.new(params[:valid_email])

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
    regex = Regexp.new(/([0-9a-z\-_.]+@{1}[0-9a-z\-_.]+([a-z]){2,5})/i)
    matchdata = regex.match(params[:valid_email][:email])
    good_emails = []
    bad_emails = []
    while matchdata != nil
      valid_email = ValidEmail.new(params[:valid_email].merge(:email => matchdata[0]))
      if valid_email.save
        good_emails << valid_email.email
      else
        bad_emails << valid_email.email
      end
      matchdata = regex.match(matchdata.post_match)
    end

    notice = "<p>#{good_emails.count} email(s) were successfully saved.</p><ul><li>#{good_emails.join('; ')}</li></ul>"
    notice += "<p>#{bad_emails.count} email(s) failed to save:</p><li>#{bad_emails.join('</li><li>')}</li></ul>" if bad_emails.any?

    respond_to do |format|
      if good_emails.any?
        format.html { redirect_to valid_emails_path, notice: notice }
        format.json { head :no_content }
      else
        format.html { redirect_to new_valid_email_path(:valid_email => params[:valid_email]), notice: "You didn't submit any valid email addresses. Please try again." }
        format.json { head :no_content }
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
