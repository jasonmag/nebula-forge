class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:about,:contact]
  before_action :get_blogs, only: [:index]
  before_action :get_projects, only: [:index]

  def index
  end

  def about
  end

  def contact
  end

  private

  def get_blogs
    @blogs = Blog.order(created_at: :desc).first(3)
  end

  def get_projects
    @projects = Project.order(created_at: :desc).first(3)
  end
end
