class AthletesController < ApplicationController

    def index
      if params[:level].present?
        @athletes = Athlete.where(level: params[:level])
      else
        @athletes = Athlete.all
      end
    end

    def show
        @athlete = Athlete.find(params[:id])
    end

    def edit
    @athlete = Athlete.find(params[:id])
    end

    def new
      @athlete = Athlete.new
    end

    def create
         @athlete = Athlete.create(
          # athlete_full_name: params[:athlete_full_name],
          first_name: params[:first_name],
          email: params[:email],
          phone: params[:phone],
          dob: params[:dob],
          height: params[:height],
          weight: params[:weight],
          power_of_ten: params[:power_of_ten],
          address: params[:address],
          school_name: params[:school_name],
          level: params[:level].to_i,
         )

        if  @athlete.save
            flash[:success] = "Athlete Profile created!"
            redirect_to  athlete_path(@athlete)
            puts "#{params[:level]}"
        else
            flash[:error] = "Ooops something went wrong!"
            render 'new'
        end
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

  def athlete_full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(name)
    parts = name.split(" ", 2)
    self.first_name = parts[0]
    self.last_name = parts[1]
  end

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :dob, :height, :weight, :email, :phone, :school_name, :address, :power_of_ten, :level, :image)
  end

end