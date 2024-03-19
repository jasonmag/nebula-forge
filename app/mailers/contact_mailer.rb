class ContactMailer < ApplicationMailer
  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: 'legioiadiutrix01@gmail.com', from: email, subject: 'Contact Form Submission')
  end
end 
