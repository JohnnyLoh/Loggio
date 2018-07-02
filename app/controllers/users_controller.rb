class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    @columns = Column.where(user: current_user)
    authorize @user

    @userteams = []
    @assTeams = AssignedTeam.where(user_id: @user.id)
    @assTeams.each do |aTea|
      @userteams << aTea.team
    end
  end

  def edit
  end

  def update
  end
end
