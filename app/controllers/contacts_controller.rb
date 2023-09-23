class ContactsController < ApplicationController    

    def new
        @contact = Contact.new
      end
    
      def create
        @contact = Contact.new(contact_params)
    
        if @contact.save
          ContactMailer.contact_email(@contact.name, @contact.email, @contact.message, @contact.phone).deliver_later
    
          render json: { message: 'Message sent successfully' }, status: :created
        else
          render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
        end
      end

    def index
        @contacts = Contact.all
        render json: @contacts
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :phone, :message)
    end

end