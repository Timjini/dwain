    
module Api
    module V1
        class IndividualSessionsController < ApplicationController

          include IndividualSessionsHelper


            def create
                individual_session = IndividualSession.new(individual_session_params)
                
                user = User.find_by(email: individual_session_params[:student_email])

                if user.nil?
                  create_single_booking_user(user,individual_session_params[:student_email])
                else
                  individual_session.user_id = user.id
                end
                
                if individual_session.save
                    render json: individual_session, status: :created, serializer: IndividualSessionSerializer
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
                        :student_full_name,
                        :student_email,
                        :student_phone
                      )
                end
        end
    end
end