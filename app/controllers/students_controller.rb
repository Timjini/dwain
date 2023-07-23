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
    end



end