class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.all
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.new(workout_params)
        respond_to do |format|
            if @workout.save
                format.html { redirect_to workout_path(@workout), notice: "Training session was successfully created." }
                format.json { render :show, status: :created, location: @workout }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @workout.errors, status: :unprocessable_entity }
            end
        end
    end 



    private

    def workout_params
        params.require(:workout).permit(:title, :description, :release_date, :video, :video_link, :coach_id, :image, :video)
    end

end