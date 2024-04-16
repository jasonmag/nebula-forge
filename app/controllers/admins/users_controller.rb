class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_users, only: [ :index ]
  before_action :get_user, only: %i[ edit show ]

  def index
  end

  def new 
  end

  def create 
  end

  def show
  end

  def edit
  end
  
  def update
  end

  def destroy   
  end

  protected

  def get_users
    @users = User.all
  end

  def get_user
    @user = User.find(params[:id])
  end
end
