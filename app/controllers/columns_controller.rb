class ColumnsController < ApplicationController
  def new
    @column = Column.new
    authorize @column
    raise
  end

  def create
    puts params
    @column = Column.new(params_column)
    @column.user = current_user
    @team_ids = params[:column][:team_ids].drop(1)
    @team_ids.each do |team_id|
      @team = Team.find(team_id.to_i)
      @column.teams << @team
    end
    authorize @column
    if @column.save
      redirect_to users_show_path
    else
      render :new
    end
  end

  def destroy
    @column = Column.find(params[:id])
    @column.destroy
    authorize @column
    redirect_to users_show_path
  end

  private

  def params_column
    params.require(:column).permit(:name, :description, :shared, :teams)
  end
end
