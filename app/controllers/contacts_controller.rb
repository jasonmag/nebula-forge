class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new,:create ]

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    ContactMailer.send_contact_email(name, email, message).deliver_later
    redirect_to root_path, notice: 'Message sent successfully!'
  end
end
