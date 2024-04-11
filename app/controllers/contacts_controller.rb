class ContactsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [ :new,:create ]

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    agree = params[:agree]
  
    if name.blank? || email.blank? || message.blank? || agree == '0'
      @error_message = "All fields are required and agree must be true."
      render :new
      return
    end
  
    ContactMailer.send_contact_email(name, email, message).deliver_later
  
    redirect_to root_path, notice: 'Message sent successfully!'
  end  
end
