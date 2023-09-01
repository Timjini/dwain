class FeedbacksController < ApplicationController


    def index
        @feedbacks = Feedback.all

        @users = User.paginate(page: params[:page], per_page: 10) # Change per_page to your desired number of items per page
    end

    
end