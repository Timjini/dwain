class TeamsController < ApplicationController

    def index

        @team = Team.new

        @teams = Team.where(coach_id: current_coach.id)

        

         
        teams = Team.where(coach_id: current_coach.id)
        @team_members = []

        teams.each do |team|
        memberships = TeamMembership.where(team_id: team.id)

        team_members = memberships.map do |membership|
            {
            user: User.find(membership.user_id),
            membership_id: membership.id,
            team_id: team.id,
            team_name: team.name,
            team_logo: team.logo_thumbnail
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
    
    def show
        @team = Team.find(params[:id])
    end

    def new
        @team = Team.new
    end

    def teams
        @team = Team.new(team_params)
        if @team.save
            render json: { status: :created, team: @team }
        else
            render :new
        end
    end


    def create 
        @team = Team.new(team_params)
          respond_to do |format|
            if @team.save
                # redirect_to teams_path
                format.html { redirect_to teams_path, notice: "Team was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end


    private

    def team_params
        params.require(:team).permit(:name, :coach_id, :logo)
    end


end
