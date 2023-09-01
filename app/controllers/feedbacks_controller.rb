class FeedbacksController < ApplicationController


    def index
        @feedbacks = Feedback.all

        @users = User.all
    end

    
end