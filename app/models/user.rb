class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
