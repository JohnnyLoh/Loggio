class AddUsersToAssignedCards < ActiveRecord::Migration[5.2]
  def change
    add_column :assigned_cards, :users, :string
  end
end
