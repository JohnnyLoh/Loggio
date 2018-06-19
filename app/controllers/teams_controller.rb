class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # @user = current_user
    # @assigned_team = AssignedTeam.new
    @team = policy_scope(Team).order(created_at: :asc)
    authorize @team
  end

  def show
    raise
  end

  private

  # def params_team
  #   params.require(:teams).permit(:current_team)
  # end

end
