class FiltersController < ApplicationController
  def index
    p params
    team = params[:team]
    @columns = []

    Column.where(user_id: current_user.id).each do |colmn|
      colmn.teams.each do |tms|
        if tms.name == team
          @columns << colmn
        end
      end
    end
    authorize @columns

    respond_to do |format|
      format.html { render "users/show", columns: @columns}
      format.js # views/routes/filters/index.js.erb
    end
  end
end
