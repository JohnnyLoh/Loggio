class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    authorize @user
    @team = policy_scope(Route).where(@user_id)
  end

  def edit
  end

  def update
  end
end
