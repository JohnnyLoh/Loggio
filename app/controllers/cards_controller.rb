class CardsController < ApplicationController

  def new
    @column = Column.find(params[:column_id])
    @card = Card.new
    @users = []
    @column.teams.each do |team|
      team.users.each do |user|
        @users << user
      end
    end
    puts "Here comes the Users:"
    puts @users
    authorize @card
  end

  def create
    @column = Column.find(params[:column_id])
    @card = Card.new(params_card)
    @card.user = current_user
    authorize @card
    @card.column = @column
    puts "NEW Card about to save:"
    p @card
    if @card.save
      redirect_to users_show_path
    else
      render :new
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    authorize @card
    redirect_to users_show_path
  end

  private

  def params_card
    params.require(:card).permit(:name, :description, :users)
  end

end
