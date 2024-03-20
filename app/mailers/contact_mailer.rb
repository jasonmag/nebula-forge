class ContactMailer < ApplicationMailer
  default from: 'notification@jasonmag.com'

  def send_contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: 'jasonmaglangit@gmail.com', subject: 'Contact Us Submission')
  end
end 
