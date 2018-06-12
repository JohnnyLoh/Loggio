class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :position
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
