class AthletesController < ApplicationController

    def index
        @athletes = Athlete.where(level: params[:level])
    end

    def show
        @athlete = Athlete.find(params[:id])
    end

    def edit
    @athlete = Athlete.find(params[:id])
    end

    def update
    @athlete = Athlete.find(params[:id])
    if @athlete.update(athlete_params)
      flash[:success] = "Athlete updated"
            redirect_to athlete_path(@athlete)
    else
      render :edit
    end
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :dob, :height, :weight, :email, :phone, :school_name, :address, :power_of_ten, :level, :image)
  end

end
