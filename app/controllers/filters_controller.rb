class FiltersController < ApplicationController
  def index
    p params
    team = params[:team]
    @columns = []

    policy_scope(Column).where(user_id: current_user.id).each do |colm|
      colm.teams.each do |tms|
        if tms.name == team
          @columns << colm
          p colm
        end
      end
    end

    p "filters controller:"
    p @columns
    p "end filters controler"

    respond_to do |format|
      format.html { render "users/show", columns: @columns}
      format.js # views/routes/filters/index.js.erb
    end
  end
end
