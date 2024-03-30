class ContactMailer < ApplicationMailer

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: 'jasonmaglangit+100@gmail.com', subject: 'JasonMag - Contact Us Submission')
  end
end 
