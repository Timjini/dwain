class FeedbacksController < ApplicationController


    def index
        # @feedbacks = Feedback.paginate(page: params[:page], per_page: 10)

        @feedbacks = Feedback.includes(:user, :coach).paginate(page: params[:page], per_page: 10)
        

        @users = User.paginate(page: params[:page], per_page: 10) # Change per_page to your desired number of items per page

        @users_list = User.all
    end

    def new
        @feedback = Feedback.new
    end

    def create
        @feedback = Feedback.new(feedback_params)

        if @feedback.save
            redirect_to '/feedbacks', notice: 'Feedback was successfully created'
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

    def destroy
        @feedback = Feedback.find(params[:id])

        if @feedback.destroy
            redirect_to '/feedbacks', flash: { success: 'Feedback was successfully deleted' }
        else
            redirect_to '/feedbacks', flash: { error: 'Failed to delete feedback' }
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