class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :position
      t.text :description
      t.string :photo
      t.references :user, foreign_key: true, index: true
      t.references :column, foreign_key: true, index: true

      t.timestamps
    end
  end
end
