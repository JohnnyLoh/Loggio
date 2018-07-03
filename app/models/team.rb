class Team < ApplicationRecord
  # belongs_to :user

  has_many :assigned_teams, dependent: :destroy
  has_many :users, through: :assigned_teams

  has_many :assigned_columns, dependent: :destroy
  has_many :columns, through: :assigned_columns

  has_many :assigned_admins, dependent: :destroy
  has_many :users, through: :assigned_admins

  accepts_nested_attributes_for :assigned_teams
  accepts_nested_attributes_for :assigned_admins
end
