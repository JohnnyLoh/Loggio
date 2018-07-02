class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # @user = current_user
    # @assigned_team = AssignedTeam.new
    @team = policy_scope(Team).order(created_at: :asc)
    authorize @team
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  def new
    @team = Team.new
    @users = []
    current_user.teams.each do |team|
      team.users.each do |user|
        @users << user
      end
    end
    authorize @team
  end

  def create
    @team = Team.new(params_team)
    @team.users << current_user
    authorize @team
    if @team.save
      puts "Team is saved ..."
      params[:team][:admins].drop(1).each do |a_id|
        @user = User.find(a_id)
        @asst = AssignedTeam.create(user_id: @user.id, team_id: @team.id)
        @team.assigned_teams << @asst
        puts "AssignedAdmin saved ... "
      end
      redirect_to users_show_path
    else
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    authorize @team
    redirect_to teams_path
  end

  private

  def params_team
    params.require(:team).permit(:name, :description, :admin)
  end

end
