class ColumnsController < ApplicationController
  def new
    @column = Column.new
    @team = Team.find(params[:team])
    authorize @column
  end

  def create
    @column = Column.new(params_column)
    @column.user = current_user
    if params[:column][:team_ids]
      @team_ids = params[:column][:team_ids].drop(1)
      @team_ids.each do |team_id|
        @team = Team.find(team_id.to_i)
        @column.teams << @team
      end
    else
      @team = Team.find(params[:team_ids])
      @column.teams << @team
    end
    authorize @column
    if @column.save
      redirect_to users_show_path
    else
      render :new
    end
  end

  def update
    @column = Column.find(params[:id])
    @team_ids = params[:column][:team_ids].drop(1)
    current_user.teams.each do |team|
      if !@team_ids.include?(team.id.to_s)
        @asC = AssignedColumn.where(team_id: team.id, column_id: @column.id)
        authorize @asC
        if !@asC[0].nil?
          @asC[0].destroy
        end
      end
    end
    @team_ids.each do |team_id|
      if team_id == "false"
        AssignedColumn.where(team_id: @team.id, column_id: @column.id).destroy
      elsif @team = Team.find(team_id.to_i)
        if !@column.teams.all? {|team| team == @team}
            @column.teams << @team
        end
      else
        render :new
      end
    end
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

  def params_updatecolumn
    params.require(:column).permit(:team_ids, :id)
  end
end
