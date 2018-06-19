class ColumnsController < ApplicationController
  def new
    @column = Column.new
    authorize @column
  end

  def create
    @column = Column.new(params_column)
    authorize @column
    if @column.save
      redirect_to users_show_path
    else
      render :new
    end
  end

  private

  def params_column
    params.require(:column).permit(:name, :description, :shared)
  end
end
