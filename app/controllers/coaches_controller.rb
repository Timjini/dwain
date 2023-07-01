class CoachesController < ApplicationController

    def show
        @coach = Coach.find(params[:id])
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

    end

    def profile
        @coach = current_coach
    end

end