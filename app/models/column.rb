class Column < ApplicationRecord
  belongs_to :user

  has_many :columns

  has_many :assigned_columns, dependent: :destroy
  has_many :teams, through: :assigned_columns
end
