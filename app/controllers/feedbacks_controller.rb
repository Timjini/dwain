class FeedbacksController < ApplicationController


    def index
        @feedbacks = Feedback.all

        @users = User.paginate(page: params[:page], per_page: 10) # Change per_page to your desired number of items per page
    end

    def new
        @feedback = Feedback.new
    end

    def create
        @feedback = Feedback.new(feedback_params)

        if @feedback.save
            redirect_to @feedback, notice: 'Feedback was successfully created.'
        else
            render :new
        end
    end

     def feedbacks
        @feedback = Feedback.new(feedback_params)
        if @feedback.save
            render json: { status: :created, feedback: @feedback }
        else
            render :new
        end
    end



    private

    def feedback_params
        params.require(:feedback).permit(
                :user_id,
                :coach_id,
                :comment,
                :rating,
                student_performance: [
                :speed,
                :endurance,
                :technique,
                :consistency,
                :race_strategy,
                :mental_status,
                :attitude
                ]
            )
    end
    
end