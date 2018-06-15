class CreateAssignedTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_teams do |t|
      t.references :user, foreign_key: true, index: true
      t.references :team, foreign_key: true, index: true

      t.timestamps
    end
  end
end
