class StudentWorkoutsController < ApplicationController
    

    def index
    end

    def new
        @workout = Workout.new
    end

end