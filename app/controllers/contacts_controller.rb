class ContactsController < ApplicationController    

    def new
        @contact = Contact.new
      end
    
      def create
        @contact = Contact.new(contact_params)
    
        if @contact.save
          ContactMailer.contact_email(@contact.name, @contact.email, @contact.message, @contact.phone).deliver_later
          redirect_to thank_you_path, notice: 'Message sent successfully'
        else
          render :new
        end
      end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :phone, :message)
    end

end