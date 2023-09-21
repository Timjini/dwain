class StudentsController < ApplicationController

    def show
        @student = Student.find(params[:id])

        @training_sessions = TrainingSession.where(coach_id: @coach.id)

        @workouts = Workout.where(coach_id: @coach.id)
    end

     def profile
        
        @training_sessions = TrainingSession.all
        @training_sessions_today = @training_sessions.select do |training_session|
            training_session.day == Date.today.strftime("%A")
        end
        
        @workouts = Workout.last(3)

        @last_workout = Workout.last
    end

    def dashboard_student
        # teams = Team.where(coach_id: current_coach.id)
        # @team_members = []

        # teams.each do |team|
        # memberships = TeamMembership.where(team_id: team.id)

        # team_members = memberships.map do |membership|
        #     {
        #     user: User.find(membership.user_id),
        #     membership_id: membership.id,
        #     team_id: team.id,
        #     team_name: team.name
        #     }
        # end

        # @team_members.concat(team_members)
        # end
        @coaches = Coach.last(5)

        # get training sessions by today's day of the week
        @training_sessions = TrainingSession.all
        @training_sessions_today = @training_sessions.select do |training_session|
            training_session.day == Date.today.strftime("%A")
        end

    end

    def goals_rewards_achievements
        @coach_feedback = Feedback.where(user_id: current_user.id).last


        feedbacks = Feedback.where(user_id: current_user.id)

            # Initialize a hash to store the best values for each attribute
            @best_values = {
            speed: nil,
            endurance: nil,
            technique: nil,
            consistency: nil,
            mental_status: nil,
            race_strategy: nil,
            attiude: nil
            }

            # Iterate through the feedback records to find the best value for each attribute
            feedbacks.each do |feedback|
            
            speed = feedback.student_performance["speed"].to_i
            endurance = feedback.student_performance["endurance"].to_i
            technique = feedback.student_performance["technique"].to_i
            consistency = feedback.student_performance["consistency"].to_i
            mental_status = feedback.student_performance["mental_status"].to_i
            race_strategy = feedback.student_performance["race_strategy"].to_i
            attitude = feedback.student_performance["attitude"].to_i

            # Update the best value for each attribute if a higher value is found
            @best_values[:speed] = [speed, @best_values[:speed]].compact.max
            @best_values[:endurance] = [endurance, @best_values[:endurance]].compact.max
            @best_values[:technique] = [technique, @best_values[:technique]].compact.max
            @best_values[:consistency] = [consistency, @best_values[:consistency]].compact.max
            @best_values[:mental_status] = [mental_status, @best_values[:mental_status]].compact.max
            @best_values[:race_strategy] = [race_strategy, @best_values[:race_strategy]].compact.max
            @best_values[:attitude] = [attitude, @best_values[:attitude]].compact.max
            end

        

    end



end