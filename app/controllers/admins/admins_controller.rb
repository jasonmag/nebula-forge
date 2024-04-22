class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_admins, only: [:index]
  before_action :get_admin, only: %i[ edit update show destroy ]
  before_action :admin_params, only: [ :create, :update ]

  def index
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_admin_path(@admin.id), notice: "Admin was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_admin_path, notice: "Admin was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    respond_to do |format|
      if @admin.destroy
        format.html { redirect_to admins_admins_path, notice: 'Admin was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admins_admins_path, alert: 'Failed to delete admin.' }
        format.json { render json: @admin.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  protected

  def admin_params
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params.require(:admin).permit(:avatar, :first_name, :last_name, :email)
    else
      params.require(:admin).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
    end
  end

  def get_admins
    @admins = Admin.all
  end

  def get_admin
    @admin = Admin.find(params[:id])
  end
  
end
