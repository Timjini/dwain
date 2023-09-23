module AthleteProfileHelper

    # def create_athlete_when_user_sign_in(first_name, last_name,dob, email, phone,height,weight,power_of_ten,school_name,address,city,user_id)
    def create_athlete_when_user_sign_in(user)

        # user = User.find(user_id)

        athlete = AthleteProfile.new
        athlete.first_name = user.first_name 
        athlete.last_name = user.last_name
        # athlete.dob = user.dob
        athlete.email = user.email
        # athlete.phone = user.phone
        # athlete.height = user.height
        # athlete.weight = user.weight
        #athlete.power_of_ten = user.power_of_ten
        #athlete.school_name = user.school_name
        # athlete.address = user.address
        # athlete.city = user.city
        # athlete.image = user.avatar
        athlete.level = 0
        athlete.user_id = user.id

        if athlete.save!
            # send_notification_to_coach
            return  { status: 'success' }
        else
            return { status: 'failure' }
        end


    end


    def create_user(athlete)
        user_profile = User.where(id: athlete.user_id)
                 .or(User.where(email: athlete.email))
                 .or(User.where("LOWER(first_name) = ?", athlete.first_name.downcase))
                 .or(User.where("LOWER(last_name) = ?", athlete.last_name.downcase))
        puts "*********** #{user_profile}"

        if user_profile.nil?
            user = User.new
            user.first_name = athlete.first_name
            user.last_name = athlete.last_name
            user.email = athlete.email 
            
            # Generate a reset password token
            user.reset_password_token = Devise.token_generator.generate(User, :reset_password_token)
            user.reset_password_sent_at = Time.now.utc

            user.save(validate: false)

            if user.save!
                user.send_reset_password_instructions
            else
                flash[:error] = "Something went wrong"
                puts "#{error}"
            end
        end

    end


end