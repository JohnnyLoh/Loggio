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
    authorize @team
  end

  def create
    @team = Team.new(params_team)
    # @team.user = current_user
    authorize @team
    if @team.save
      redirect_to new_column_path, team: @team
    else
      render :new
    end
  end

  private

  def params_team
    params.require(:team).permit(:name, :description)
  end

end
