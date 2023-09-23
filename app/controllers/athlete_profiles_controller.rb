class AthleteProfilesController < ApplicationController

  include AthleteProfileHelper

    def index
      if params[:level].present?
        @athletes = AthleteProfile.where(level: params[:level])
      else
        @athletes = AthleteProfile.all
      end
    end

    def show
        @athlete = AthleteProfile.find(params[:id])
    end

    def edit
    @athlete = AthleteProfile.find(params[:id])
    end

    def new
      @athlete = AthleteProfile.new
    end

    def create
        params[:athlete_profile][:level] = params[:level].to_i

        # user = User.find(params[:user_id])

          @athlete = AthleteProfile.create!(athlete_params)

        
          if @athlete.save
            create_user(@athlete)
            flash[:success] = "AthleteProfile Profile created!"
            redirect_to athlete_profile_path(@athlete)
          else
            flash[:warning] = "Ooops something went wrong!"
            render 'new'
          end


    end


    def update

      params[:athlete][:level] = params[:level].to_i

      @athlete = AthleteProfile.find(params[:id])
      if @athlete.update(athlete_params)
        flash[:success] = "AthleteProfile updated"
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
    params.require(:athlete_profile).permit(:first_name, :last_name, :dob, :height, :weight, :email, :phone, :school_name, :address,:city, :power_of_ten, :level, :image, :user_id)
  end

end