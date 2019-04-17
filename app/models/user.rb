
class User < ApplicationRecord
  # validates :username, presence: true, length: {maximum: 50}, uniqueness: true

  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_many :expenses, dependent: :destroy

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
