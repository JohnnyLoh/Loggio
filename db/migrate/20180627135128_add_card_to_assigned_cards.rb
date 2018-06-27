class AddCardToAssignedCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :assigned_cards, :card, foreign_key: true
  end
end
