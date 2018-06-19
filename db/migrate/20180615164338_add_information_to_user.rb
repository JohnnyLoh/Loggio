class AddInformationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :password, :integer
    add_column :users, :admin, :boolean
    add_column :users, :handy_nr, :integer

    add_reference :users, :team, foreign_key: true
    # add_reference :users, :assigned_team, foreign_key: true
  end
end
