module IndividualSessionsHelper

    def create_single_booking_user(user,student_email)
        user = User.find_by(email: student_email)
            if user.nil?
            User.create(
                email: student_email,
                password: "password",
                )
            else 
                user
            end
    end
end
