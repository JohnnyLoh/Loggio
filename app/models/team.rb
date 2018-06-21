class Team < ApplicationRecord
  has_many :assigned_teams, dependent: :destroy
  has_many :users, through: :assigned_teams

  has_many :assigned_columns, dependent: :destroy
  has_many :columns, through: :assigned_columns
end
