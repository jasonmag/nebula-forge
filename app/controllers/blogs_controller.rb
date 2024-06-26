class BlogsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_blog, only: %i[ show edit update destroy preview]
  before_action :get_authors, only: [ :new,:create,:edit ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.published_for_user(current_user)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/1/preview
  def preview
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        flash[:type] = "success"
        flash[:message] = "Blog was successfully created."
        format.html { redirect_to blog_url(@blog) }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        flash[:type] = "success"
        flash[:message] = "Blog was successfully updated."
        format.html { redirect_to blog_url(@blog) }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy!
    flash[:type] = "success"
    flash[:message] = "Blog was successfully destroyed."
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:slug])
      if !user_signed_in? && !@blog.published
        flash[:type] = "error"
        flash[:message] = "This Blog is not published."
        redirect_to blogs_url and return
      end
      @meta_description = @blog.title
      @meta_keywords = @blog.tags
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :published, :image_source, :author_id, :tags)
    end

    # Get list of authors
    def get_authors 
      @authors = User.all
    end
end
