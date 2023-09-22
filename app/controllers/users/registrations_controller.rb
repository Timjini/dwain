class Users::RegistrationsController < Devise::RegistrationsController


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.persisted?  # Check if the user was successfully saved
      sign_in(@user)  # Manually sign in the user
      flash[:success] = "Athlete Profile created!"
      redirect_to dashboard_student_users_path
    else
      flash[:alert] = "Oops, something went wrong!"
      render 'new'
    end
  end

  
  prepend_view_path 'app/views/users'

  private
  def user_params
    params.require(:user).permit(:email, :encrypted_password, :dob, :phone , :username, :first_name, :last_name, :address, :city , :avatar , :password, :password_confirmation)
  end
end
