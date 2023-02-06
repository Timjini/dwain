class ContactMailer < ApplicationMailer
    default from: 'contact@chambersforsport.com'
  
    def contact_email(name, email, message, phone)
      @name = name
      @email = email
      @phone = phone
      @message = message
  
      mail(to: ['dwain.chambers@chambersforsport.com'], bcc: ['hatim.jini@gmail.com'], subject: 'Contact Message')
    end
  end