class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.includes(:coach).all
    end

    def gallery
        @workouts = Workout.includes(:coach).all
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def edit
      if current_coach.present?
        @workout = Workout.find(params[:id])
        else
        flash[:alert] = "You are not allowed to edit"
        redirect_to root_path
    end
    end

    def update 
        @workout = Workout.find(params[:id])
        @workout.description = params[:description]
        @workout.title = params[:title]
        @workout.video_link = params[:video_link]
        @workout.coach_id = params[:coach_id]
        @workout.release_date = params[:release_date]

        if @workout.update(workout_params)
            flash[:success] = "Workout updated"
            redirect_to workout_path(@workout)
        else
            flash[:alert] = "Something went wrong"
            render :edit
        end
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
        params.require(:workout).permit(:title, :description, :release_date, :video, :video_link, :coach_id, :image)
    end

end