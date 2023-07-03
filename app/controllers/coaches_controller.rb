class CoachesController < ApplicationController

    def show
        @coach = Coach.find(params[:id])

        @training_sessions = TrainingSession.where(coach_id: @coach.id)

        @workouts = Workout.where(coach_id: @coach.id)
    end

    def teams
        teams = Team.where(coach_id: current_coach.id)
        @team_members = []

        teams.each do |team|
        memberships = TeamMembership.where(team_id: team.id)

        team_members = memberships.map do |membership|
            {
            user: User.find(membership.user_id),
            membership_id: membership.id,
            team_id: team.id,
            team_name: team.name
            }
        end

        @team_members.concat(team_members)
        end
        @coaches = Coach.where.not(id: current_coach.id).last(5)

        # get training sessions by today's day of the week
        @training_sessions = TrainingSession.all
        @training_sessions_today = @training_sessions.select do |training_session|
            training_session.day == Date.today.strftime("%A")
        end

    end
    

    def dashboard_coach
        teams = Team.where(coach_id: current_coach.id)
        @team_members = []

        teams.each do |team|
        memberships = TeamMembership.where(team_id: team.id)

        team_members = memberships.map do |membership|
            {
            user: User.find(membership.user_id),
            membership_id: membership.id,
            team_id: team.id,
            team_name: team.name
            }
        end

        @team_members.concat(team_members)
        end
        @coaches = Coach.where.not(id: current_coach.id).last(5)

        # get training sessions by today's day of the week
        @training_sessions = TrainingSession.all
        @training_sessions_today = @training_sessions.select do |training_session|
            training_session.day == Date.today.strftime("%A")
        end

    end

    def profile
        @coach = current_coach
        # find training sessions by day of the week
        @training_sessions = TrainingSession.all
        @training_sessions_today = @training_sessions.select do |training_session|
            training_session.day == Date.today.strftime("%A")
        end
        
        @workouts = Workout.where(coach_id:current_coach.id)

        @last_workout = Workout.last
    end

    def teams

         teams = Team.where(coach_id: current_coach.id)
        @team_members = []

        teams.each do |team|
        memberships = TeamMembership.where(team_id: team.id)

        team_members = memberships.map do |membership|
            {
            user: User.find(membership.user_id),
            membership_id: membership.id,
            team_id: team.id,
            team_name: team.name
            }
        end

        @team_members.concat(team_members)
        end


        @coaches = Coach.where.not(id: current_coach.id).last(5)
    end

end