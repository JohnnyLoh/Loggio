class CreateAssignedAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_admins do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
