class Team < ApplicationRecord
  # belongs_to :user

  has_many :assigned_teams, dependent: :destroy
  has_many :users, through: :assigned_teams
end
