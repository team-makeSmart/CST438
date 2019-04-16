class User < ApplicationRecord
  validates :username, presence: true, length: {maximum: 50}, uniqueness: true
  validates :password_digest, presence: true, length: {minimum: 6}
  validates :password, presence: true, length: {minimum: 6}
  has_secure_password
  has_many :expenses, dependent: :destroy

  def User.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end


  # login through twitter ------------------------------------------------------
  def self.from_omniauth(auth)
    where(:username => auth['info']['nickname']) #|| create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      # user.provider = auth['provider']
      user.username = auth['info']['nickname']
      user.password = "password"

      user.password_digest = "password"
    end
  end
  # ----------------------------------------------------------------------------
end
