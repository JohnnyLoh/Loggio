class Card < ApplicationRecord
  belongs_to :user

  belongs_to :column

  has_many :assigned_cards, dependent: :destroy
  has_many :users, through: :assigned_cards
end
