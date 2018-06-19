class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    authorize @user
  end

  def edit
  end

  def update
  end
end
