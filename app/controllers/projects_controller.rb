class ProjectsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_project, only: %i[ show edit update destroy preview]
  before_action :get_authors, only: [ :new,:create,:edit]

  # GET /projects or /projects.json
  def index
    @projects = Project.published_for_user(current_user)
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /blogs/1/preview
  def preview
  end
  
  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:slug])
      @meta_description = @project.title
      @meta_keywords = @project.tags
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :content, :tags, :image_source, :published, :author_id)
    end

    # Get list of authors
    def get_authors 
      @authors = User.all
    end
end
