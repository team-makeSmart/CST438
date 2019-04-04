class Expense < ApplicationRecord

  belongs_to :user

  default_scope -> {order(created_at: :desc)}

  validates :user_id, presence: true
  validates :amount, presence: true, numericality: true
  validates :description, presence: true, length: {maximum: 40}
  validates :category, presence: true, length: {maximum: 40}


end
