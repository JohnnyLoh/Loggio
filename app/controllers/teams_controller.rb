class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  # skip_before_action :authenticate_team!, only: :index

  def index
    # @teams = policy_scope(Team).order(created_at: :asc)
    @assTs = policy_scope(AssignedTeam).where(user_id: current_user.id).order(created_at: :asc)

    @team = []
    @assTs.each do |assTs|
      @team << assTs.team
    end
    # authorize @team
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  def new
    @team = Team.new
    @users = []
    current_user.teams.each do |team|
      team.assigned_teams.each do |a_team|
        @thisuser = User.find(a_team.user_id)
        @users << @thisuser
      end
    end
    authorize @team
  end

  def create
    @team = Team.new(params_team)
    # @team.user = current_user
    authorize @team
    if @team.save
      puts "Team is saved ..."
      params[:team][:assigned_admins].drop(1).each do |a_id|
        @assad = AssignedAdmin.create(user_id: a_id.to_i, team_id: @team.id)
        # @team.assigned_admins << @assad
        puts "AssignedAdmin saved ... "
      end
      params[:team][:assigned_teams].drop(1).each do |u_id|
        # @user = User.find(u_id)
        @asst = AssignedTeam.create(user_id: u_id.to_i, team_id: @team.id)
        # @team.assigned_teams << @asst
        puts "AssignedTeam saved ... "
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
    params.require(:team).permit(:name, :description)
  end

end
