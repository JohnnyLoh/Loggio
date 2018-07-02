class FiltersController < ApplicationController
  def index
    team = params[:team]
    @columns = []
    if team == "All Teams"
      policy_scope(Column).where(user_id: current_user.id).each do |colm|
            @columns << colm
      end
    else
      policy_scope(Column).where(user_id: current_user.id).each do |colm|
        colm.teams.each do |tms|
          if tms.name == team
            @columns << colm
          end
        end
      end
    end

    @user = current_user
    @userteams = []
    @assTeams = AssignedTeam.where(user_id: @user.id)
    @assTeams.each do |aTea|
      @userteams << aTea.team
    end


    respond_to do |format|
      format.html { render "users/show", columns: @columns}
      format.js # views/routes/filters/index.js.erb
    end
  end
end
