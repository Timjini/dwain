module AthleteHelper

    # def create_athlete_when_user_sign_in(first_name, last_name,dob, email, phone,height,weight,power_of_ten,school_name,address,city,user_id)
    def create_athlete_when_user_sign_in(user)

        # user = User.find(user_id)

        athlete = Athlete.new
        #athlete.first_name = user.first_name 
        #athlete.last_name = user.last_name
        #athlete.dob = user.dob
        athlete.email = user.email
        #athlete.phone = user.phone
        #athlete.height = user.height
        #athlete.weight = user.weight
        #athlete.power_of_ten = user.power_of_ten
        #athlete.school_name = user.school_name
        #athlete.address = user.address
        #athlete.city = user.city
        athlete.level = 0
        athlete.user_id = user.id

        if athlete.save!
            # send_notification_to_coach
            return  { status: 'success' }
        else
            return { status: 'failure' }
        end


    end


end