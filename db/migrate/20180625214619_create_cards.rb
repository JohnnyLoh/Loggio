class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      # t.references :column, foreign_key: true
      # t.references :assigned_card, foreign_key: true

      t.timestamps
    end
  end
end
