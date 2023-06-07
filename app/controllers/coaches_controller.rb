class CoachesController < ApplicationController

    def show
        @coach = Coach.find(params[:id])
    end

    def dashboard_coach
        team = Team.where(coach_id: current_coach.id).first

            if team.nil?
                @team_members = []
            else
            memberships = TeamMembership.where(team_id: team.id)

            @team_members = memberships.map do |membership|
                # push user and user's team membership id into hash
                { user: User.find(membership.user_id), membership_id: membership.id , team_id: team.id, team_name: team.name}
            end
            end

    end

end