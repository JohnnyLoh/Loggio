class CreateAssignedColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_columns do |t|
      t.references :team, foreign_key: true
      t.references :column, foreign_key: true

      t.timestamps
    end
  end
end
