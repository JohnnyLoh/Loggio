class CreateAssignedCards < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_cards do |t|
      t.references :user, foreign_key: true
      # t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
