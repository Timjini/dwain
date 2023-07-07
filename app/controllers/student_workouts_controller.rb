class StudentWorkoutsController < ApplicationController
    

    def index
        @workouts = Workout.all
    end

    def new
        @workout = Workout.new
    end

end