class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_users, only: [ :index ]
  before_action :get_user, only: %i[ edit update show destroy ]
  before_action :user_params, only: [ :create, :update ]

  def index
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_user_path(@user.id), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to admins_user_path, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to admins_users_path, notice: 'User was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admins_users_path, alert: 'Failed to delete user.' }
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
  

  protected

  def user_params
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params.require(:user).permit(:first_name, :last_name, :email)
    else
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end  

  def get_users
    @users = User.all
  end

  def get_user
    @user = User.find(params[:id])
  end
end
