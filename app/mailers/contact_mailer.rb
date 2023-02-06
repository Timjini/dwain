class ContactMailer < ApplicationMailer
    default from: 'contact@example.com'
  
    def contact_email(name, email, message, phone)
      @name = name
      @email = email
      @phone = phone
      @message = message
  
      mail(to: 'dwain.chambers@chambersforsport.com', cc: 'hatim.jini@gmail.com', subject: 'Contact Message')
    end
  end