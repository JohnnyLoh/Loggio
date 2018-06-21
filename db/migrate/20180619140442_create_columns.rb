class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.boolean :shared, default: false

      # t.references :user, foreign_key: true, index: true
      # t.references :team, foreign_key: true, index: true

      # validates :description, presence: true, length: { minimum: 5 }

      t.timestamps
    end
  end
end
