class CardsController < ApplicationController

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    authorize @card
    redirect_to cards_show_path
  end

end
