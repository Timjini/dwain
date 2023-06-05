    
module Api
    module V1
        class IndividualSessionsController < ApplicationController


            def create
                individual_session = IndividualSession.new(individual_session_params)
                
                if individual_session.save
                    
                    render json: individual_session, status: :created, serializer: IndiviualSessionsSerializer
                  else
                    render json: { errors: individual_session.errors.full_messages }, status: :unprocessable_entity
                  end
            end
                
                
                
                

              private

                def individual_session_params
                    # params.require(:session).permit(:user_id, :coach_id, :session_date, :session_time, :duration, :location, :status, :booking_type, :payment_status, :payment_method, :payment_id, :payment_amount, :payment_currency, :payment_description, :client_full_name, :client_email, :client_phone)
                    params.require(:individual_session).permit(
                        :user_id,
                        :coach_id,
                        :session_time,
                        :session_date,
                        :client_full_name,
                        :client_email,
                        :client_phone
                      )
                end
        end
    end
end