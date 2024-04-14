class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_users, only: [ :index ]
  before_action :getuser, only: %i [ edit show ]

  def index
  end

  def show
  end

  def edit
  end

  private

  def get_users
    @users = User.all
  end

end
