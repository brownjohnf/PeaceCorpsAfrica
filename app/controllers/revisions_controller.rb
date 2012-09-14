class RevisionsController < ApplicationController
  load_and_authorize_resource

  # GET /revisions
  # GET /revisions.json
  def index
    @page = Page.find(params[:page_id])
    @revisions = @page.revisions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @revisions }
    end
  end

  # GET /revisions/1
  # GET /revisions/1.json
  def show
    @page = Page.find(params[:page_id])
    @revision = @page.revisions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @revision }
    end
  end

  # DELETE /revisions/1
  # DELETE /revisions/1.json
  def destroy
    @revision = Revision.find(params[:id])
    @revision.destroy

    respond_to do |format|
      format.html { redirect_to @revision.page }
      format.json { head :no_content }
    end
  end
end
