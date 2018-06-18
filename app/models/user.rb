class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assigned_teams
  has_many :teams, through: :assigned_teams, dependent: :destroy

  has_many :created_routes, class_name: 'Route'
end
