class HomeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index,:about,:contact, :privacy_policy]
  before_action :get_blogs, only: [:index]
  before_action :get_projects, only: [:index]

  def index
    set_meta
  end

  def about
  end

  def contact
  end

  def privacy_policy
  end

  private

  def get_blogs
    @blogs = Blog.published.order(created_at: :desc).first(3)
  end

  def get_projects
    @projects = Project.published_for_user(current_user).order(created_at: :desc).first(3)
  end
end
